//
//  LiveFlightByAirlineViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import UIKit

class LiveFlightByAirlineViewController: BaseViewController {
    
    var output: LiveFlightByAirlineViewOutput?
   
    // MARK: - Subviews
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Airline name or ICAO code"
        searchController.searchBar.autocapitalizationType = .allCharacters
        return searchController
    }()
   
    
    // MARK: Initialization
    
    init(
        output: LiveFlightByAirlineViewOutput
    ) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
        
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
//        title = "LIVE flight by airline"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
//        // Hide back button
//        navigationItem.hidesBackButton = true
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
        
        setupNavigationBar()
    }
    
    private func setupSubviews() {
//        view.addSubview(label)
    }
    
    private func setupSearchField() {

    }
    
    private func setupNavigationBar() {
          navigationItem.searchController = searchController
      }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
//            searchBar.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor)
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
}

extension LiveFlightByAirlineViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
      searchFor(searchText)
    }
    
}

//extension LiveFlightByAirlineViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        searchController.showsSearchResultsController = true
//    }
//}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension LiveFlightByAirlineViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    
    }
 }
