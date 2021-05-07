//
//  APIErrors.swift
//  Network
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import Alamofire

public enum APIErrors: Error {  
  case forbidden              //Status code 403
  case notFound               //Status code 404
  case conflict               //Status code 409
  case internalServerError    //Status code 500
  case unknownError           //Status code not known
  
}
