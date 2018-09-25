//
//  ApiRouterProtocol.swift
//  Movies
//
//  Created by Olga Saliy on 8/14/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

protocol ApiRouterProtocol: URLRequestConvertible {
    
    /// Router URL.
    var urlPath: URL { get }
    
    /// Path added to base url
    var path: String { get }
    
    /// HTTP method.
    var method: HTTPMethod { get }
    
    /// List of parameters for request (depends on http method)
    var parameters: Parameters { get }
    
    /// Request body.
    var body: String? { get }
    
    /// Request headers.
    var headers: [String: String] { get }
    
}

// MARK: - Default implementation for protocol
extension ApiRouterProtocol {
    
    var urlPath: URL {
        return URL(fileURLWithPath: Constants.Configuration.baseURL)
    }
    
    var body: String? {
        return nil
    }
    
    var parameters: Parameters {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    private var defaultHeaders: [String: String] {
        return ["Accept": "application/json",
                "Content-Type": "application/json"]
    }
    
    private var allHeaders: [String: String] {
        var map = defaultHeaders
        for (key, value) in headers {
            map[key] = value
        }
        return map
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: urlPath.appendingPathComponent(path),
                                        method: method,
                                        headers: allHeaders)
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        urlRequest.appendAPIKey()
        
        if let body = body?.data(using: String.Encoding.utf8) {
            urlRequest.httpBody = body
        }
        
        return urlRequest
    }
    
}

private extension URLRequest {
    
    mutating func appendAPIKey() {
        guard let url = url else {
            return
        }
        
        let queryItem = URLQueryItem(name: Constants.Configuration.apiKey.name, value: Constants.Configuration.apiKey.value)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if urlComponents?.queryItems?.isEmpty ?? true {
            urlComponents?.queryItems = [queryItem]
        } else {
            urlComponents?.queryItems?.append(queryItem)
        }
        
        self.url = urlComponents?.url
    }
    
}
