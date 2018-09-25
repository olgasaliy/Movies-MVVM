//
//  FavoriteMoviesPresenetImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class FavoriteMoviesPresenetImpl: FavoriteMoviesPresenter {
    
    private weak var view: FavoriteMoviesView?
    private let repository: FavoriteRepository
    
    init(_ view: FavoriteMoviesView?, _ repository: FavoriteRepository) {
        self.view = view
        self.repository = repository
    }
    
    func search(by query: String?) {
        guard let query = query, !query.isEmpty else {
            return
        }
        
        let moviesDetails = repository.fetch(by: query)
        let movieItems = FavoritesMoviesConverter.covertCells(from: moviesDetails)
        view?.display(movies: movieItems)
    }
    
    func fetchAll() {
        let moviesDetails = repository.fetchAll()
        let movieItems = FavoritesMoviesConverter.covertCells(from: moviesDetails)
        view?.display(movies: movieItems)
    }
    
}
