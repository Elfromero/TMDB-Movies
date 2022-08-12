//
//  MoviesListResponse.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 12.08.2022.
//

import Foundation

class MoviesListResponse: Decodable {
    let page: Int?
    let results: [Movie]
}
