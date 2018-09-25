//
//  SpokenLanguage.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class SpokenLanguage: Mappable {
    
    var iso: Int?
    var name: String?
    
    init() { }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        iso <- map["iso_639_1"]
        name <- map["name"]
    }
    
}

extension SpokenLanguage: ToManagedObjectMapping {
    
    func asManagedObject(with context: NSManagedObjectContext) -> CDSpokenLanguage {
        let managedObject: CDSpokenLanguage = context.insertObject()
        
        managedObject.iso = Double(iso ?? 0)
        managedObject.name = name
        
        return managedObject
    }
    
}

extension CDSpokenLanguage: FromManagedObjectMapping {
    
    func asMappable() -> SpokenLanguage {
        let object = SpokenLanguage()
        
        object.iso = Int(iso)
        object.name = name
        
        return object
    }
    
}
