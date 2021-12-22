//
//  APIClient.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

public class APIClient: NSObject {
    
    private var session: URLSession!
    private var dataTask: URLSessionDataTask?
    var downloadTask : URLSessionDownloadTask?
    
    override public init() {
        super.init()
        self.session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
    }
    
    
    /// Data task to get json responsee from url - GET
    /// - Parameters:
    ///   - url: url
    ///   - completion: completion block to return Data or Error
    /// - Returns: Fetched Data or Error
    public func jsonDataTask (url : URL, completion: @escaping (Result <Data,Error>) -> ()) {
        
        dataTask = session.dataTask(with: url){[weak self]data,response,error in
            defer {
                self?.dataTask = nil
            }
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            else if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    
                    if let data = data {
                        completion(.success(data))
                    }
                    else {
                        //Invalid Data
                        completion(.failure(AstronautAppError.invalidData))
                    }
                }
                else {
                    //Invalid Status code
                    completion(.failure(AstronautAppError.invalidStatusCode(response.statusCode)))
                }
            }
            else{
                //Invalid Response
                completion(.failure(AstronautAppError.invalidResponse))
            }
        }
        dataTask?.resume()
    }
    /// Download task to get Image or any file data  from url - GET
    /// - Parameters:
    ///   - url: url
    ///   - completion: completion block to return Image Data or Error
    /// - Returns: Fetched Data for downloaded file or Error
    
    public func downloadDataTask (url : URL, completion: @escaping (Result<Data,Error> ) -> ()) {
        downloadTask = session.downloadTask(with: url, completionHandler: {[weak self] (localUrl , response, error) in
            
            defer {
                self?.downloadTask = nil
            }
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            else if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    if let localUrl = localUrl {
                        do {
                            let data = try Data(contentsOf: localUrl)
                                completion(.success(data))
                            
                        } catch  {
                            completion(.failure(AstronautAppError.invalidData))
                        }
                    }
                    else {
                        //Invalid local url
                        completion(.failure(AstronautAppError.invalidFile))
                    }
                    
                }
                else{
                    //Invalid Status code
                    completion(.failure(AstronautAppError.invalidStatusCode(response.statusCode)))
                }
            }
            else{
                //Invalid Response
                completion(.failure(AstronautAppError.invalidResponse))
            }
            
        })
        downloadTask?.resume()
    }
}
