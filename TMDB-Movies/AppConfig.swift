//
//  AppConfig.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 12.08.2022.
//

import Foundation

class AppConfig {
    
    static let shared = AppConfig()
    
    let apiKey: String = "9ca96c84dc11d775598d9033ef5d35b7"
    
    private init() {}
}

