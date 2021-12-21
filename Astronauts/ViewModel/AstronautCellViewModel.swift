//
//  AstronautCellViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct AstronautCellViewModel {
    var name : String
    var nationality : String
    var profileThumbnailImageURL : URL?
    var apiServiceProtocol : APIServiceProtocol
        
    init(astronaut : Astronaut, apiServiceProtocol : APIServiceProtocol) {
        self.name = astronaut.name
        self.nationality = astronaut.nationality
        if let imgUrl = astronaut.profile_image_thumbnail{
            self.profileThumbnailImageURL = URL(string: imgUrl)
        }
        
        self.apiServiceProtocol = apiServiceProtocol
    }

    func fetchProfileImage(completion : @escaping (UIImage?, Error?)->()){
        self.apiServiceProtocol.fetchProfileImage(imageUrl: self.profileThumbnailImageURL) { image, error in
            if let  error = error {
                print(error.localizedDescription)
                completion(image, error)
            }
            else {
                completion(image,error)
            }
            
        }
    }
}
