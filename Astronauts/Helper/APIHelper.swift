//
//  APIHelper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct APIHelper : APIServiceProtocol {
    
    private let apiClient = APIClient()
    
    func fetchAstronauts(completion: @escaping (AstronautsData?, Error?) -> ()) {
        let astronaughtsURL = URL(string: Constants.API.baseURL)!
        var astronautsData : AstronautsData?
        
        apiClient.jsonDataTask(url: astronaughtsURL) { data, error in
            
            if (error != nil){
                completion(astronautsData,error)
            }
            else {
                if let astronautsAPIData = data {
                    do {
                        
                      astronautsData = try JSONDecoder().decode(AstronautsData.self , from: astronautsAPIData)
                        completion(astronautsData,error)
                    }
                    catch {
                        completion(astronautsData,AstronautAppError.jsonParsingError)
                    }
                }
                else {
                    completion(astronautsData,AstronautAppError.noResultsFound)
                }
            }
        }
        
    }
    
    func fetchProfileImage(imageUrl : URL? , completion : @escaping(UIImage?,Error?)->()){
        guard let  imageUrl = imageUrl else {
            completion(nil, AstronautAppError.invalidUrl)
            return
        }
        apiClient.downloadDataTask(url: imageUrl) { data, error in
            var image : UIImage?
            if let error = error {
                print(error.localizedDescription)
                completion(image, error)
            }
            else {
                if let  img = UIImage(data: data!){
                    image = img
                    completion(image,error)
                }
                else {
                    completion(image, AstronautAppError.invalidFile)
                }
            }
            
        }
    }
    
}
