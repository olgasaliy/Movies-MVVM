//
//  GeneralDetailsCell.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

protocol GeneralDetailsCellDelegate: class {
    
    func didPressLikeButton()
    func didUnpressLikeButton()
}

class GeneralDetailsCell: UITableViewCell {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var language: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    
    weak var delegate: GeneralDetailsCellDelegate?
    
    private var item: GeneralDetailsItem?
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        guard var isLiked = item?.isLiked else {
            return
        }
        
        if isLiked {
            delegate?.didUnpressLikeButton()
            isLiked = false
            likeButton.setImage(#imageLiteral(resourceName: "notliked"), for: .normal)
        } else {
            delegate?.didPressLikeButton()
            isLiked = true
            likeButton.setImage(#imageLiteral(resourceName: "liked"), for: .normal)
        }
    }

}

extension GeneralDetailsCell: ConfigurableCell {
    
    func configure(with item: TableViewCellItem) {
        guard let item = item as? GeneralDetailsItem else {
            return
        }
        
        self.item = item
        
        title.text = item.title
        rating.text = item.rating
        language.text = item.originalLanguage
        releaseDate.text = item.releaseDate
        setImage(by: item.imageURL)
        setDefaultLike()
    }
    
    private func setImage(by url: String?) {
        guard let imageUrl = url else {
            self.posterImage.image = #imageLiteral(resourceName: "not-available")
            return
        }
        self.posterImage.load(from: imageUrl)
    }
    
    private func setDefaultLike() {
        guard let isLiked = item?.isLiked else {
            return
        }
        likeButton.setImage(isLiked ? #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "notliked") , for: .normal)
    }
}

