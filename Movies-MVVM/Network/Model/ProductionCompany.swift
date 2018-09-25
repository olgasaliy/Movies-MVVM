//
//  ProductionCompany.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class ProductionCompany: Mappable {
    
    var id: Int!
    var name: String?
    var originCountry: String?
    
    init() { }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        originCountry <- map["origin_country"]
    }
    
}

extension ProductionCompany: ToManagedObjectMapping {
    
    func asManagedObject(with context: NSManagedObjectContext) -> CDProductionCompany {
        let managedObject: CDProductionCompany = context.insertObject()
        
        managedObject.id = Double(id)
        managedObject.name = name
        managedObject.originCountry = originCountry
        
        return managedObject
    }
    
}

extension CDProductionCompany: FromManagedObjectMapping {
    
    func asMappable() -> ProductionCompany {
        let object = ProductionCompany()
        
        object.id = Int(id)
        object.name = name
        object.originCountry = originCountry
        
        return object
    }
    
}
