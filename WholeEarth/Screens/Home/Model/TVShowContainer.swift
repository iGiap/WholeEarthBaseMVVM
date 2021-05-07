//
//  TVShowContainer.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import Foundation

struct TVShowContainer: Codable {
  var page: Int?
  var results: [TVShow]?
  var totalPages: Int?
  var totalResults: Int?
  
  private enum CodingKeys: String, CodingKey {
    case page = "page"
    case results = "results"
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
  
}
