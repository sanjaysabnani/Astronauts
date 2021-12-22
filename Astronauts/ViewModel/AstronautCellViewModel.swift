//
//  AstronautCellViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 22/12/2021.
//

import Foundation
import UIKit

struct AstronautCellViewModel {
    var id : Int
    var name : String?
    var nationality : String?
    var profileThumbnailImageURL : URL?
    
    var apiServiceProtocol : APIServiceProtocol
        
    init(astronaut : Astronaut, apiServiceProtocol : APIServiceProtocol) {
        self.id = astronaut.id
        self.name = astronaut.name
        self.nationality = astronaut.nationality
        self.profileThumbnailImageURL = URL(string: astronaut.profile_image_thumbnail!)
        self.apiServiceProtocol = apiServiceProtocol
    }
    
    func fetchThumbnailProfileImage(url : URL?, completion : @escaping (Result<UIImage, Error>)->()){
        self.apiServiceProtocol.fetchProfileImage(imageUrl: url) { result in
           completion(result)
            
        }
    }
}
