//
//  FavoriteMoviesContract.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

protocol FavoriteMoviesView: class {
    
    func display(movies: [MovieItem])
    func show(error: String)
    
}

protocol FavoriteMoviesPresenter {
    
    func search(by query: String?)
    func fetchAll()

}
