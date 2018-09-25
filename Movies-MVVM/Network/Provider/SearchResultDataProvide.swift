//
//  SearchResultDataProvide.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

class SearchResultDataProvider: DataProvider {
    
    func search(by query: String, completion: @escaping (_ response: SearchResult?, _ error: Error?) -> ()) {
        execute(request: SearchResultRouter.search(query: query), completion: completion)
    }
    
}
