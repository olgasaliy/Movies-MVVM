//
//  DataProvider.swift
//  Movies
//
//  Created by Olga Saliy on 8/14/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import RxAlamofire
import RxSwift

class DataProvider {
    
    private let sessionManager: SessionManager

    convenience init() {
        let sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
        self.init(sessionManager)
    }
    
    init(_ sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func execute<T : Mappable>(request: URLRequestConvertible) -> Observable<T> {
        return sessionManager
            .rx
            .request(urlRequest: request)
            .observeOn(MainScheduler.instance)
            .json()
            .map({ json -> T in
                guard let response = Mapper<T>().map(JSONObject: json) else {
                    throw RxError.noElements
                }
                return response
            })
    }
    
    func execute<T : Mappable>(request: URLRequestConvertible) -> Observable<[T]> {
        return sessionManager
            .rx
            .request(urlRequest: request)
            .observeOn(MainScheduler.instance)
            .json()
            .map({ json -> [T] in
                guard let response = Mapper<T>().mapArray(JSONObject: json) else {
                    throw RxError.noElements
                }
                return response
            })
    }
}
