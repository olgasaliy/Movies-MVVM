//
//  RedirectionViewController.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class RedirectionViewController: UIViewController {

    private let dataProvider = ConfigurationDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider.getConfiguration { [weak self] (configuration, error) in
            LocalDataStorage.default.imageUrl = configuration?.images.secure_base_url
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self?.redirectToMainStoryboard()
            })
        }
    }
    
    private func redirectToMainStoryboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "initialController") as UIViewController
        present(vc, animated: true, completion: nil)
    }

}
