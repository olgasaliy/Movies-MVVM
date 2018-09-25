//
//  SearchResultDataProvide.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class SearchResultDataProvider: DataProvider {
    
    func search(by query: String) -> Observable<SearchResult> {
        return execute(request: SearchResultRouter.search(query: query))
    }
    
}
