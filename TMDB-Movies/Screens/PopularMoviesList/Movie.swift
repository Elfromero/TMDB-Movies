//
//  Movie.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 12.08.2022.
//

import Foundation

struct Movie: Codable {
    var id: Int?
    var title: String?
    var posterPath: String?
    var popularity: Double?
    var overview: String?
    var backdropPath: String?
    
    static var mock: Movie {
        Movie(id: 123456789, title: "Thor", posterPath: "", popularity: 4, overview: "ololololololo", backdropPath: "")
    }
}

