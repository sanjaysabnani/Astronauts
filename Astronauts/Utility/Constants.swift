//
//  Constants.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation
public struct Constants {
    public struct API {
        static let baseURL = "https://spacelaunchnow.me/api/3.5.0/astronaut/"
        
    }
    public struct Identifiers {
        static let astronautCell = "astronautCell"
        
    }
    public struct segues {
        static let astronautDetailSegue = "astronautDetails"
        
    }
    public struct Titles {
        static let astronauts = "Astronauts"
    }
    public struct Assets {
        public struct Images {
            static let sort = "sort"
        }
    }
    public struct Strings {
        static  let unknown = "Unknown"
        static let ok = "Ok"
        static let error = "Error"
        static let unableToDownloadImg = "Unable to download Profile Image."
        static let unableToFetchDetails = "Unable to fetch Astronaut details."
    }
}
