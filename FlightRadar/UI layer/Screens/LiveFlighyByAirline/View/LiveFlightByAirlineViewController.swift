//
//  LiveFlightByAirlineViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import UIKit

class LiveFlightByAirlineViewController: BaseViewController {
    
    var output: LiveFlightByAirlineViewOutput?
    let searchController: StandartSearchController
   
    // MARK: - Subviews
    
   
    
    // MARK: Initialization
    
    init(
        output: LiveFlightByAirlineViewOutput,
        searchController: StandartSearchController
    ) {
        self.output = output
        self.searchController = searchController
        
        super.init(nibName: nil, bundle: nil)
        
        searchController.searchResultsUpdater = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupView() {
        title = "Flight by route"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
//        // Hide back button
//        navigationItem.hidesBackButton = true
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
        
        // Setup search
        navigationItem.searchController = searchController
    }
    
    private func setupSubviews() {
//        view.addSubview(label)
    }
    
    private func setupSearchField() {

    }
    
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
//            label.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
//            label.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
//
 
        ])
    }
}

extension LiveFlightByAirlineViewController: LiveFlightByAirlineViewInput {
    
}

extension LiveFlightByAirlineViewController {
    func searchFor(_ searchText: String) {
        
    }
    
    func stopSearch() {
        searchController.showsSearchResultsController = false
        searchController.searchBar.searchTextField.backgroundColor = nil
    }
}

extension LiveFlightByAirlineViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
      searchFor(searchText)
    }
    
    func searchBarCancelButtonClicked(
        _ searchBar: UISearchBar
    ) {
      stopSearch()
    }
}

extension LiveFlightByAirlineViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
}
