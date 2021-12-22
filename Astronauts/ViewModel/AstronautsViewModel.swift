//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

struct AstronautsViewModel {
    var apiServiceProtocol : APIServiceProtocol
    
    func getAstronautsList(url : URL, completion: @escaping (Result<[Astronaut], Error>) -> ()){
        
        apiServiceProtocol.fetchAstronauts(url: url) { result in
           
            switch result {
            case .success(let astronautsData):
                completion(.success(astronautsData.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func sort(astronauts : [Astronaut], ascending : Bool = true )-> [Astronaut]{
        ascending ? astronauts.sorted(by: {$0.name < $1.name}) : astronauts.sorted(by: {$0.name > $1.name})
        
    }
    

    
}
