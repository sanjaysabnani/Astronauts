//
//  MockAPIHElper.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

struct MockAPIHelper : APIServiceProtocol {
    
    func fetchAstronauts(url: URL, completion: @escaping (Result<AstronautsData, Error>) -> ()) {
        
    }
    
    func fetchProfileImage(imageUrl: URL?, completion: @escaping (Result<UIImage, Error>) -> ()) {
        
    }
    
    func fetchAstronautDetail(url: URL, completion: @escaping (Result<Astronaut, Error>) -> ()) {
        
    }
    
}
