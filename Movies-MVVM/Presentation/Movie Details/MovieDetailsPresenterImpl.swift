//
//  MovieDetailsPresenterImpl.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MovieDetailsPresenterImpl: MovieDetailsPresenter {
    
    private weak var view: MovieDetailsView?
    private let dataProvider: MoviesDataProvider
    private let repository: FavoriteRepository
    private var movieDetails: MovieDetails?
    
    init(_ view: MovieDetailsView?, _ dataProvider: MoviesDataProvider, _ repository: FavoriteRepository) {
        self.view = view
        self.dataProvider = dataProvider
        self.repository = repository
    }
    
    func getDetails(by id: Int?) {
        guard let id = id else {
            view?.show(error: "Urecognized movie")
            return
        }
        
        if let movie = repository.fetch(by: id) {
            movieDetailsLoaded(movie, nil)
        } else {
            dataProvider.getDetails(by: id, completion: movieDetailsLoaded(_:_:))
        }   
    }
    
    private func movieDetailsLoaded(_ movieDetail: MovieDetails?, _ error: Error?) {
        guard let details = movieDetail, error == nil else {
            view?.show(error: error?.localizedDescription ?? "Unknown error")
            return
        }
        
        self.movieDetails = details
        
        view?.hideProgress()
        let sections = MovieDetailsConverter(details, repository).convertSections()
        view?.display(details: sections)
    }
}


extension MovieDetailsPresenterImpl: GeneralDetailsCellDelegate {
    
    func didPressLikeButton() {
        addMovieToFavorites()
    }
    
    func didUnpressLikeButton() {
        removeMovieFromFavorites()
    }
    
    
    private func addMovieToFavorites() {
        guard let movie = movieDetails else {
            view?.show(error: "Movie hasn't been downloaded yet")
            return
        }
        repository.add(movie)
    }
    
    private func removeMovieFromFavorites() {
        guard let movie = movieDetails else {
            view?.show(error: "Movie hasn't been downloaded yet")
            return
        }
        repository.remove(movie)
    }
    
    
}
