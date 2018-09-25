//
//  MoviesDataProvider.swift
//  Movies
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

class MoviesDataProvider: DataProvider {
    
    func getDetails(by id: Int, completion: @escaping (_ response: MovieDetails?, _ error: Error?) -> ()) {
        execute(request: MoviesRouter.getDetails(id: id), completion: completion)
    }
}
