//
//  AstronautCellViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct AstronautDetailsViewModel {
    var id : Int
    var name : String
    var nationality : String
    var profileThumbnailImageURL : URL?
    var profileImageURL : URL?
    var bio : String?
    var dob : String?
    var apiServiceProtocol : APIServiceProtocol
        
    init(astronaut : Astronaut, apiServiceProtocol : APIServiceProtocol) {
        self.id = astronaut.id
        self.name = astronaut.name
        self.nationality = astronaut.nationality
        self.profileThumbnailImageURL = URL(string: astronaut.profile_image_thumbnail!)
        self.profileImageURL = URL(string: astronaut.profile_image!)
        self.bio = astronaut.bio
        self.dob = astronaut.date_of_birth
        self.apiServiceProtocol = apiServiceProtocol
    }

    func fetchProfileImage(url : URL?, completion : @escaping (UIImage?, Error?)->()){
        self.apiServiceProtocol.fetchProfileImage(imageUrl: url) { image, error in
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
