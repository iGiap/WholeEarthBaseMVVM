//
//  HomeEndpoint.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import Foundation
import Networking

enum HomeEndpoint: EndPointProvider {
  
  case trendingShow(timeWindow: String)
  case image(width: String, posterPath: String)
  
  
  func provideUrl() -> String {
    switch self {
    case .trendingShow(let timeWindow):
      return "trending/tv/\(timeWindow)"
    case .image(let width, let posterPath):
      return "https://image.tmdb.org/t/p/w\(width)/\(posterPath)"
    }
  }
  
}
