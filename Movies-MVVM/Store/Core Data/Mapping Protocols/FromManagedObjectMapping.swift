//
//  FromManagedObjectMapping.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper

protocol FromManagedObjectMapping {
    associatedtype T: Mappable
    func asMappable() -> T
}
