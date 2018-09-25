//
//  CompanyDetailsCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class CompanyDetailsCell: UITableViewCell {

    @IBOutlet private weak var name: UILabel!
    
}

extension CompanyDetailsCell: ConfigurableCell {
    
    func configure(with item: TableViewCellItem) {
        guard let item = item as? CompanyDetailsItem else {
            return
        }
        self.name.text = item.name
    }
    
}
