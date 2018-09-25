//
//  Images.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

class Images: Mappable {
    
    var secure_base_url: String!
    
    init() { }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        secure_base_url <- map["secure_base_url"]
    }
    
}
