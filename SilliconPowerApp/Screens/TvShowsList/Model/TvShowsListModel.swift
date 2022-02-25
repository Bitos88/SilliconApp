//
//  TvShowsListModel.swift
//  SilliconPowerApp
//
//  Created by Alberto Alegre Bravo on 24/2/22.
//

import Foundation


//struct TvShowsListModel: Codable {
//    let page: Int
//    let results: [TvShow]
//    
//}
//
//struct TvShow: Codable {
//    let poster_path: String?
//    let popularity: Int
//    let id: Int
//    let backdrop_path: String
//    let vote_average: Int
//    let overview: String
//    let first_air_date: String
//    let original_language: String
//    let vote_count: Int
//    let name: String
//    let original_name: String
//    
//}

struct TvShowsListModel: Codable {
    let page: Int?
    let results: [TvShow]
}

// MARK: - Result
struct TvShow: Codable {
    let backdropPath, firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
