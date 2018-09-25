//
//  ToManagedObjectMapping.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import CoreData

protocol ToManagedObjectMapping {
    associatedtype T: NSManagedObject
    func asManagedObject(with context: NSManagedObjectContext) -> T
}
