//
//  ConfigurationRouter.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

enum ConfigurationRouter: ApiRouterProtocol {
    
    case getConfiguration
    
    var path: String {
        return "configuration"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
