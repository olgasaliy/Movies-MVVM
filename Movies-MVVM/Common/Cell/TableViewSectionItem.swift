//
//  TableViewSectionItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/27/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class TableViewSectionItem {
    
    let name: String
    let items: [TableViewCellItem]
    
    init(name:String, items: [TableViewCellItem]) {
        self.name = name
        self.items = items
    }
}
