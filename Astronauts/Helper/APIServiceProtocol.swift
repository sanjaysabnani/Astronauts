//
//  ServiceAPIProtocol.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

protocol APIServiceProtocol {
    
func fetchAstronauts(completion : @escaping (_ astronauts  : AstronautsData?, _ error : Error?)->())

}
