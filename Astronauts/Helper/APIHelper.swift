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
    
    func fetchAstronauts(url : URL, completion: @escaping (AstronautsData?, Error?) -> ()) {
        var astronautsData : AstronautsData?
        
        apiClient.jsonDataTask(url: url) { data, error in
            
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
    func fetchAstronautDetail(url : URL, completion: @escaping (Astronaut?, Error?) -> ()) {
        var astronaut : Astronaut?
        apiClient.jsonDataTask(url: url) { data, error in
            
            if (error != nil){
                completion(astronaut,error)
            }
            else {
                if let astronautsAPIData = data {
                    do {
                        
                        astronaut = try JSONDecoder().decode(Astronaut.self , from: astronautsAPIData)
                        completion(astronaut,error)
                    }
                    catch {
                        completion(astronaut,AstronautAppError.jsonParsingError)
                    }
                }
                else {
                    completion(astronaut,AstronautAppError.noResultsFound)
                }
            }
        }
    }
    
    
    func fetchProfileImage(imageUrl : URL? , completion : @escaping(UIImage?,Error?)->()){
        guard let  imageUrl = imageUrl else {
            completion(nil, AstronautAppError.invalidUrl)
            return
        }
        //Getting cached Image
        if let cachedImage = cachedImages.object(forKey: imageUrl as NSURL){
           completion(cachedImage,nil)
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
                    self.cachedImages.setObject(image!, forKey: imageUrl as NSURL)
                    
                    completion(image,error)
                }
                else {
                    completion(image, AstronautAppError.invalidFile)
                }
            }
            
        }
    }
    
}
