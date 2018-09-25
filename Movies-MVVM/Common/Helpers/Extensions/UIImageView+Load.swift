//
//  UIImageView+Load.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func load(from url: String) {
        guard let baseUrl = LocalDataStorage.default.imageUrl else {
            image = #imageLiteral(resourceName: "not-available")
            return
        }
        let url = URL(string: baseUrl + PosterSizes.medium.rawValue + url)
        self.kf.setImage(with: url)
    }
    
}
