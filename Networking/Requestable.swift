//
//  Requestable.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import Alamofire

public struct Requestable {
    
    // MARK: - Variables
    
    // Parameters that will be passed into url
    // as query string
    public var parameters: Parameters?
    
    // Additional path will be added to source url
    public var path: String?
    
    // The HTTP Method of the request
    // Ex: .get, .post
    public var method: HTTPMethod?
    
    // MARK: - Initializer
    public init(path: String = "", parameters: Parameters? = [:], method: HTTPMethod? = .get) {
        self.path = path
        self.parameters = parameters
        self.method = method
    }
    
}
