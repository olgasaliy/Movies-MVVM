//
//  MovieDetailsController.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/23/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MovieDetailsTableViewController: UITableViewController {

    @IBOutlet private weak var headerView: UIView!
    
    private let dataProvider = MoviesDataProvider()
    private var sections = [TableViewSectionItem]()
    
    var favoriteRepository: FavoriteRepository!
    var presenter: (MovieDetailsPresenter & GeneralDetailsCellDelegate)?
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteRepository = FavoriteRepository(CoreDataConteiner.default)
        presenter = MovieDetailsPresenterImpl(self, dataProvider, favoriteRepository)
        
        presenter?.getDetails(by: movieId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if  sections.count > 0 {
            presenter?.getDetails(by: movieId)
        }
    }
    
}

extension MovieDetailsTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        
        if let cell = cell as? ConfigurableCell {
            cell.configure(with: item)
        }
        
        if let cell = cell as? GeneralDetailsCell {
            cell.delegate = presenter
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }

}

extension MovieDetailsTableViewController: MovieDetailsView {
    
    func displayProgress() {
        tableView.tableHeaderView = headerView
    }
    
    func hideProgress() {
        tableView.tableHeaderView = nil
    }
    
    func display(details: [TableViewSectionItem]) {
        self.sections = details
        tableView.reloadData()
    }
    
    
    func show(error: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: error,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
