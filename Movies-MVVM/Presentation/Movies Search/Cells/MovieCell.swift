//
//  MovieCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/20/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet private weak var imageLogo: UIImageView!
    @IBOutlet private weak var name: UILabel!
    
}

extension MovieCell: ConfigurableCell {

    func configure(with item: TableViewCellItem) {
        guard let item = item as? MovieItem else {
            return
        }
        setImage(by: item.imageURL)
        self.name.text = item.title
    }
    
    private func setImage(by url: String?) {
        guard let imageUrl = url else {
            self.imageLogo.image = #imageLiteral(resourceName: "not-available")
            return
        }
        self.imageLogo.load(from: imageUrl)
    }
    
}
