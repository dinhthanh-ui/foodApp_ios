//
//  AppError.swift
//  FoodApp
//
//  Created by Macbook Pro on 09/09/2022.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response Could not be decoded"
        case .unknownError:
            return " Bruhhh !!! I have no idea qhat go on"
        case .invalidUrl:
            return "HEYYY !!! Give me a valid Url"
        case .serverError(let error):
            return error
        }
    }
}
