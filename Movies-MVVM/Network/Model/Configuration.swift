//
//  Configuration.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

class Configuration: Mappable {
    
    var images: Images!
    
    init() { }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        images <- map["images"]
    }
    
}
