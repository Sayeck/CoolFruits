//
//  NetworkError.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

enum NetworkError: Error {
    case badURLError
    case genericError
    case customError(_ message: String)
}

extension NetworkError: LocalizedError {
    
    var localizedDescription: String {
        switch self {
        case .badURLError:
            return NSLocalizedString("Bad url format", comment: "")
        case .genericError:
            return NSLocalizedString("Network error", comment: "")
        case .customError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
    
}
