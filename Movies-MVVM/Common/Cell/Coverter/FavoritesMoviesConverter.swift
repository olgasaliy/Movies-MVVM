//
//  FavoritesMoviesConverter.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class FavoritesMoviesConverter {
    
    static func covertCells(from moviesDetails: [MovieDetails]) -> [MovieItem] {
        return moviesDetails.compactMap { MovieItem(movieDetails: $0) }
    }
    
}
