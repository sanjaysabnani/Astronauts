//
//  APIHelper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

class APIHelper : APIServiceProtocol {
    static let shared = APIHelper()
    private let apiClient = APIClient()
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    func fetchAstronauts(url: URL, completion: @escaping (Result<AstronautsData, Error>) -> ()) {
        apiClient.jsonDataTask(url: url) { result in
           switch result {
                case .success(let data):
                do {
                    
                 let astronautsData = try JSONDecoder().decode(AstronautsData.self , from: data)
                    completion(.success(astronautsData))
                }
                catch {
                    completion(.failure(AstronautAppError.jsonParsingError))
                }
                    
                case .failure(let error):
               completion(.failure(error))
                    
        }
    }
    }
    
    func fetchProfileImage(imageUrl: URL?, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let  imageUrl = imageUrl else {
            completion(.failure (AstronautAppError.invalidUrl))
            return
        }
        //Getting cached Image
        if let cachedImage = cachedImages.object(forKey: imageUrl as NSURL){
            completion(.success(cachedImage))
            return
        }
        
        
        apiClient.downloadDataTask(url: imageUrl) { result in
            switch result {
                
            case .success(let data):
                if let  img = UIImage(data: data){
                    
                    self.cachedImages.setObject(img, forKey: imageUrl as NSURL)
                    
                    completion(.success(img))
                }
                else {
                    completion(.failure(AstronautAppError.invalidFile))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchAstronautDetail(url: URL, completion: @escaping (Result<Astronaut, Error>) -> ()) {
        
        apiClient.jsonDataTask(url: url) { result in
            
            switch result {
            case .success(let astronautData) :
                do {
                    
                    let astronaut = try JSONDecoder().decode(Astronaut.self , from: astronautData)
                    completion(.success(astronaut))
                }
                catch {
                    completion(.failure(AstronautAppError.jsonParsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
