//
//  MovieItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/22/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MovieItem: TableViewCellItem {
    
    let id: Int
    let title: String
    let imageURL: String?
    
    var cellIdentifier: String {
        return "movieCell"
    }
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? "Unknown"
        self.imageURL = movie.posterPath
    }
    
    init(movieDetails: MovieDetails) {
        self.id = movieDetails.id
        self.title = movieDetails.title ?? "Unknown"
        self.imageURL = movieDetails.posterPath
    }
    
}
