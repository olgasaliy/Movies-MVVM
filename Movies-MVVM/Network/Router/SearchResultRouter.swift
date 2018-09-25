//
//  SearchResultRouter.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/20/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

enum SearchResultRouter: ApiRouterProtocol {
    
    case search(query: String)
    
    var path: String {
        return "search/movie"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .search(let query):
            return ["query" : query]
        }
    }
}
