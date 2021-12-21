//
//  MockAPIHElper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct MockAPIHelper : APIServiceProtocol {
    func fetchAstronauts(url: URL, completion: @escaping (AstronautsData?, Error?) -> ()) {
        completion(nil,AstronautAppError.mockAPIError)
    }
    
    func fetchAstronautDetail(url : URL, completion: @escaping (Astronaut?, Error?) -> ()) {
        return
    }
    
    
    func fetchProfileImage(imageUrl: URL?, completion: @escaping (UIImage?, Error?) -> ()) {
        completion(nil, AstronautAppError.mockAPIError)
    }
    
    
}
