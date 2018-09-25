//
//  Constants.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/20/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

struct Constants {
    struct Configuration {
        static let baseURL = "https://api.themoviedb.org/3"
        static let apiKey = (name: "api_key", value: "f04e8ed93af390cef2ecddaf78379d66")
    }
}

enum PosterSizes: String {
    case original = "original"
    case big = "w500"
    case medium = "w185"
    case small = "w92"
}
