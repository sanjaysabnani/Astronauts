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
    case invalidStatusCode
    case invalidFile
    case noResultsFound
    case mockAPIError
    case invalidUrl
    
}


extension AstronautAppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .jsonParsingError:
            return NSLocalizedString(
                "Issue Parsing Response.",
                comment: ""
            )
            
        case .invalidData:
            return NSLocalizedString(
                "Invalid data.",
                comment: ""
            )
        case .invalidResponse:
            return NSLocalizedString(
                "Invalid Response.",
                comment: ""
            )
        case .invalidStatusCode:
            return NSLocalizedString(
                "Invalid Status code.",
                comment: ""
            )
        case .mockAPIError:
            return NSLocalizedString(
                "Mock API Error",
                comment: ""
            )
        case .invalidFile:
            return NSLocalizedString("Unable to locate file", comment: "")
        case .noResultsFound:
            return NSLocalizedString("No Results Found", comment: "")
        case .invalidUrl:
            return NSLocalizedString("Invalid File Url", comment: "")
        }
    }
}


