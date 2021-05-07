//
//  TVShow.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import Foundation

struct TVShow: Codable {
  var originalName: String?
  var id: Int?
  var name: String?
  var voteCount: Int?
  var voteAverage: Double?
  var firstAirDate: String?
  var posterPath: String?
  var genreIds: [Int]?
  var originalLanguage: String?
  var backdropPath: String?
  var overview: String?
  var originCountry: [String]?
  var popularity: Double?
  
  private enum CodingKeys : String, CodingKey {
      case originalName = "original_name"
      case id = "id"
      case name = "name"
      case voteCount = "vote_count"
      case voteAverage = "vote_average"
      case firstAirDate = "first_air_date"
      case posterPath = "poster_path"
      case genreIds = "genre_ids"
      case originalLanguage = "original_language"
      case backdropPath = "backdrop_path"
      case overview = "overview"
      case originCountry = "origin_country"
      case popularity = "popularity"
  }
}
