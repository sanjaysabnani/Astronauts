//
//  ServiceAPIProtocol.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
import UIKit

protocol APIServiceProtocol {
    
    func fetchAstronauts(url : URL, completion : @escaping (_ astronauts  : AstronautsData?, _ error : Error?)->())
    
    func fetchProfileImage(imageUrl : URL? , completion : @escaping(UIImage?,Error?)->())
    
    func fetchAstronautDetail(url : URL, completion : @escaping (_ astronautDetail  : Astronaut?, _ error : Error?)->())
}
