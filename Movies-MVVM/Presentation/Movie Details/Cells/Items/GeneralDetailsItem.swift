//
//  GeneralDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class GeneralDetailsItem: TableViewCellItem {
    
    let title: String
    let imageURL: String?
    let rating: String
    let releaseDate: String?
    let originalLanguage: String?
    
    var cellIdentifier: String {
        return "generalDetailsCell"
    }
    
    var isLiked: Bool = false
    
    init(_ movie: MovieDetails) {
        title = movie.title ?? "Unknown"
        imageURL = movie.posterPath
        rating = "\(movie.rating ?? 0.0)/10"
        releaseDate = movie.releaseDate
        originalLanguage = movie.spokenLanguages?.compactMap({ $0.name }).joined(separator: ", ")
    }
    
}
