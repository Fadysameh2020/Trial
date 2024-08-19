//
//  BaseMultiRequestHandler.swift
//  
//
//  Created by Gerges on 09/02/2023.
//
import Alamofire
import Foundation
import UIKit
// MARK: - MultiPart

protocol BaseMultiRequestHandler {
    var multipartParmter: (MultipartFormData) -> Void { get }
    func uploadMuliPart<T: Codable>(data _: T.Type) async throws -> StaticApiResponse<T>
}

extension BaseMultiRequestHandler where Self: URLRequestConvertible {
     func uploadMuliPart<T: Codable>(data _: T.Type) async throws -> StaticApiResponse<T> {
        return try await withCheckedThrowingContinuation { continuation  in
            AF.upload(multipartFormData: multipartParmter, with: self).validate().responseData { response_ in
                //=======================================================
                do {
                    let parse: StaticApiResponse<T> = try RequstParsing().handleResponse(response_)
                    continuation.resume(returning: parse)
                }catch {
                    continuation.resume(throwing: error)
                    //========================================================
                }
            }
        }
    }
}

/////
extension URLRequest: URLConvertible {
    public func asURL() throws -> URL {
        guard let url = self.url else { throw AFError.invalidURL(url: self) }
        return url
    }
}

