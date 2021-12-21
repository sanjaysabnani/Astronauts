//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

struct AstronautsViewModel {
    var apiServiceProtocol : APIServiceProtocol
    
    func getAstronautsList(url : URL, completion: @escaping ([Astronaut], Error?) -> ()){
      var astronauts = [Astronaut]()
        apiServiceProtocol.fetchAstronauts(url: url) { astronautsData, error in
            if(error != nil){
                completion(astronauts, error)
            }
            else {
                    astronauts = astronautsData?.results ?? []
                    completion(astronauts,error)
                }
            }
        
    }
    

    
}
