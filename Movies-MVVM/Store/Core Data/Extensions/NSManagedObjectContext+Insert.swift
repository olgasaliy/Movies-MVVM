//
//  NSManagedObjectContext+Insert.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func insertObject<T: NSManagedObject>() -> T {
        guard let entityName = T.entity().name else {
            fatalError("Entity does not have a name")
        }
        
        guard let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: self) as? T else {
            fatalError("Wrong object type")
        }
        
        return object
    }
    
    func saveOrRollback() {
        do {
            try save()
        } catch  {
            rollback()
            print(error.localizedDescription)
        }
    }
    
}
