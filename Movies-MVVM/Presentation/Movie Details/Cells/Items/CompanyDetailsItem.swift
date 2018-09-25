//
//  CompanyDetailsItem.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class CompanyDetailsItem: TableViewCellItem {
    
    let name: String
    
    var cellIdentifier: String {
        return "companyDetailsCell"
    }
    
    init(_ company: ProductionCompany) {
        self.name = company.name ?? "Undefined"
    }
    
}
