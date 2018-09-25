//
//  ViewController.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class MoviesSearchTableViewController: UITableViewController {

    @IBOutlet private weak var tableHeaderView: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: MoviesPresenter?
    
    private let dataProvider = SearchResultDataProvider()
    private var moviesArray = [MovieItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearch()
        hideProgress()
        
        presenter = MoviesPresenterImpl(self, dataProvider)
    }
    
    private func initSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailsSegue") {
            let vc = segue.destination as! MovieDetailsTableViewController
            if let id = tableView.indexPathForSelectedRow?.row {
                vc.movieId = moviesArray[id].id
            }
        }
    }

}

extension MoviesSearchTableViewController: MoviesView {
   
    func displayProgress() {
        tableView.tableHeaderView = tableHeaderView
    }
    
    func hideProgress() {
        tableView.tableHeaderView = nil
    }
    
    func show(error: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: error,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func display(movies: [MovieItem]) {
        moviesArray = movies
        tableView.reloadData()
    }

}

extension MoviesSearchTableViewController {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = moviesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        
        if let cell = cell as? ConfigurableCell {
            cell.configure(with: item)
        }
        
        return cell
    }
    
}

extension MoviesSearchTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        presenter?.search(by: searchController.searchBar.text)
    }
    
}

extension MoviesSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.search(by: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
