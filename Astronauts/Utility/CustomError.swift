//
//  CustomError.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import Foundation

enum AstronautAppError: Error {
    
    case jsonParsingError
    case invalidData
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidFile
    case noResultsFound
    case mockAPIError
    case invalidUrl
    
}


extension AstronautAppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .jsonParsingError:
            return NSLocalizedString("There was an issue parsing server response.",comment: "")
        case .invalidData:
            return NSLocalizedString("Invalid data received.",comment: "")
        case .invalidResponse:
            return NSLocalizedString("Invalid response received.",comment: "")
        case .invalidStatusCode(let stausCode):
            return NSLocalizedString("Server returned an invalid Status code \(stausCode).",comment: "")
        case .mockAPIError:
            return NSLocalizedString("Mock API Error",comment: "")
        case .invalidFile:
            return NSLocalizedString("Unable to locate image", comment: "")
        case .noResultsFound:
            return NSLocalizedString("No results found.", comment: "")
        case .invalidUrl:
            return NSLocalizedString("Invalid image path", comment: "")
        }
    }
}


