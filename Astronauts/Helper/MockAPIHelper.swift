//
//  MockAPIHElper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct MockAPIHelper : APIServiceProtocol {
    func fetchAstronauts(completion: @escaping (AstronautsData?, Error?) -> ()) {
        completion(nil,AstronautAppError.mockAPIError)
    }
    
    func fetchProfileImage(imageUrl: URL?, completion: @escaping (UIImage?, Error?) -> ()) {
        completion(nil, AstronautAppError.mockAPIError)
    }
    
    
}
