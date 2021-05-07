//
//  Constants.swift
//  Network
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation

public struct Constants {
    
    /// The API's base URL
    public static let baseUrl = "https://api.themoviedb.org/3/"
    
    /// Paste your API Key over here
    public static let tmdbApiKey = "c5e241681c87e0206115395de7435e28"
    
    /// The parameters (Queries) that we're gonna use
    public struct Parameters {
        public static let api_key = "api_key"
    }
    
    /// The header fields
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    /// The content type (JSON)
    public enum ContentType: String {
        case json = "application/json"
    }
    
}
