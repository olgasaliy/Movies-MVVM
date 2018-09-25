//
//  CoreDataContainer.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import CoreData

class CoreDataConteiner {
    
    static let `default`: CoreDataConteiner = {
        return CoreDataConteiner()
    }()
    
    let viewContext: NSManagedObjectContext
    let writeContext: NSManagedObjectContext
    
    private let persistenConteiner: NSPersistentContainer
    
    init() {
        persistenConteiner = NSPersistentContainer.loadModel()
        viewContext = persistenConteiner.viewContext
        writeContext = persistenConteiner.newBackgroundContext()
        writeContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        writeContext.automaticallyMergesChangesFromParent = true
    }
    
}

extension NSPersistentContainer {
    
    class func loadModel() -> NSPersistentContainer {
        let conteiner = NSPersistentContainer(name: "Model")
        conteiner.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
        }
        return conteiner
    }
    
}
