//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

struct AstronautsViewModel {
    
    private let apiHelper = APIHelper()
    
    func getAstronautsList(completion: @escaping ([Astronaut], Error?) -> ()){
      var astronauts = [Astronaut]()
        apiHelper.fetchAstronauts { astronautsData, error in
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
