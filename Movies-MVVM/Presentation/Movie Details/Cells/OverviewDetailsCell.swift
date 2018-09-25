//
//  OverviewDetailsCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class OverviewDetailsCell: UITableViewCell {

    @IBOutlet private weak var overview: UILabel!

}

extension OverviewDetailsCell: ConfigurableCell {
    
    func configure(with item: TableViewCellItem) {
        guard let item = item as? OverviewDetailsItem else {
            return
        }
        self.overview.text = item.overview
    }
    
}
