//
//  APIRequest.swift
//  Network
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import Alamofire

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}

public class APIRequest {
  public static func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, APIErrors>) -> Void) {
    AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
        //Check the result from Alamofire's response and check if it's a success or a failure
        switch response.result {
        case .success(let value):
            //Everything is fine
            completion(Result.success(value: value))
        case .failure( _):
            //Something went wrong
            switch response.response?.statusCode {
            case 403:
                completion(Result.error(error: APIErrors.forbidden))
            case 404:
                completion(Result.error(error: APIErrors.notFound))
            case 409:
                completion(Result.error(error: APIErrors.conflict))
            case 500:
                completion(Result.error(error: APIErrors.internalServerError))
            default:
                completion(Result.error(error: APIErrors.unknownError))
            }
        }
    }
  }
}
