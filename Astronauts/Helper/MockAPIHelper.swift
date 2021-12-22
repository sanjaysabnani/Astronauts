//
//  MockAPIHElper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct MockAPIHelper : APIServiceProtocol {
    var shouldThrowError : Bool
    
    func fetchAstronauts(url: URL, completion: @escaping (Result<AstronautsData, Error>) -> ()) {
        if shouldThrowError {
            completion(.failure(AstronautAppError.mockAPIError))
        }
        else{
            let astronautsJsonData = getJsonData(from: "AstronautsData")
            do {
                
             let astronautsData = try JSONDecoder().decode(AstronautsData.self , from: astronautsJsonData)
                completion(.success(astronautsData))
            }
            catch {
                completion(.failure(AstronautAppError.jsonParsingError))
            }
        }
        
    }
    
    func fetchProfileImage(imageUrl: URL?, completion: @escaping (Result<UIImage, Error>) -> ()) {
        if shouldThrowError {
            completion(.failure(AstronautAppError.mockAPIError))
        }
        else{
            completion(.success(UIImage()))
        }
    }
    
    func fetchAstronautDetail(url: URL, completion: @escaping (Result<Astronaut, Error>) -> ()) {
        if shouldThrowError {
            completion(.failure(AstronautAppError.mockAPIError))
        }
        else{
            let astronautJsonData = getJsonData(from: "Astronaut")
            do {
                
             let astronaut = try JSONDecoder().decode(Astronaut.self , from: astronautJsonData)
                completion(.success(astronaut))
            }
            catch {
                completion(.failure(AstronautAppError.jsonParsingError))
            }
        }
        
    }
    
    func getJsonData(from fileName : String) -> Data {
        var data = Data()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
               
        }
        return data
    }
}
