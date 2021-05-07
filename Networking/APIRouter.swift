//
//  APIRouter.swift
//  Network
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import Alamofire

public struct APIRouter: URLRequestConvertible {
  
  private var requestable: Requestable
  
  
  public init(requestable: Requestable) {
    self.requestable = requestable
  }
  
  private var method: HTTPMethod {
    return requestable.method!
  }
  
  public func asURLRequest() throws -> URLRequest {
    let url = try Constants.baseUrl.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(requestable.path!))
    urlRequest.httpMethod = method.rawValue
    
    
    // Common Headers
    urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
    urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
    
    //Encoding
    let encoding: ParameterEncoding = {
      switch method {
      case .get:
        return URLEncoding.default
      default:
        return JSONEncoding.default
      }
    }()
    
    return try encoding.encode(urlRequest, with: requestable.parameters!)
  }
}
