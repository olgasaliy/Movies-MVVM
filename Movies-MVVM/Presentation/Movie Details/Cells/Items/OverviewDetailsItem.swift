//
//  OverviewDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class OverviewDetailsItem: TableViewCellItem {
    
    let overview: String
    
    var cellIdentifier: String {
        return "overviewDetailsCell"
    }
    
    init(_ movie: MovieDetails) {
        self.overview = movie.overview ?? "No overview"
    }

}
