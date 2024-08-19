//
//  validator.swift
//  NetworkLayer
//
//  Created by Eslam Mohamed on 19/10/2023.
//

import Foundation

 class StaticApiResponseValidator {
    static var shared = StaticApiResponseValidator()
     func validateDefaultResponse<T:Codable>(with ApiData:StaticApiResponse<T>) throws -> T {
        guard let data = ApiData.data,let status = ApiData.status, status else {
            let message = ApiData.message
            throw ResultError.messageError(message)
        }
        
        return data
        
    }
}

 class StaticApiResponse<T:Codable>: Codable {
     let status: Bool?
     let code: Int?
     let message: String?
     let data: T?
     let token: String?
    
    
     func ValidateDataResponse<T: Codable>() throws -> T {
        guard let success = status , success ,let data = data as? T else {
            throw ResultError.messageError(message)
        }
        return data
    }
    //
     func isValidDecodable() throws {
        guard let success = status , success else {
            throw ResultError.messageError(message)
        }
    }
    
}
