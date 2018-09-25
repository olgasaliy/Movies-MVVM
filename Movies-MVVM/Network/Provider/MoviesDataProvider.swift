//
//  MoviesDataProvider.swift
//  Movies
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class MoviesDataProvider: DataProvider {
    
    func getDetails(by id: Int) -> Observable<MovieDetails> {
        return execute(request: MoviesRouter.getDetails(id: id))
    }
}
