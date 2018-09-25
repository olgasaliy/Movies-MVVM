//
//  MoviesPresenterImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MoviesPresenterImpl: MoviesPresenter {
    
    private weak var view: MoviesView?
    private let dataProvider: SearchResultDataProvider
    
    init(_ view: MoviesView?, _ dataProvider: SearchResultDataProvider) {
        self.view = view
        self.dataProvider = dataProvider
    }
    
    func search(by query: String?) {
        guard let query = query, !query.isEmpty else {
            view?.display(movies: [])
            return
        }
        
        view?.displayProgress()
        dataProvider.search(by: query, completion: moviesLoaded(_:_:))
    }
    
    private func moviesLoaded(_ searchResult: SearchResult?, _ error: Error?) {
        guard let movies = searchResult?.results, error == nil else {
            view?.show(error: error?.localizedDescription ?? "Unknown error")
            return
        }
        
        view?.hideProgress()
        let moviesItems = MoviesSearchConverter.convertCells(from: movies)
        view?.display(movies: moviesItems.sorted { $0.title < $1.title })
    }
    
}
