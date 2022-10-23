//
//  SearchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit
import MapKit

class SearchRootViewController: BaseViewController {
    
    let presenter: SearchScreenPresenter
    var output: SearchViewOutput?
    let searchController: StandartSearchController
    
    // MARK: - Subviews
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    
    init(
        presenter: SearchScreenPresenter,
        searchController: StandartSearchController
    ) {
        self.presenter = presenter
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
 
//        presenter.output?.didSelectSearchByFightNumber()
    }
    
    private func setupView() {
        title = "Find a plane"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
        
        // Hide back button
        navigationItem.hidesBackButton = true

        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]

        // Change background color
//        navigationController?.navigationBar.backgroundColor = .darkGray
        
        // Setup search
        navigationItem.searchController = searchController
    }
    
    private func setupSubviews() {
        setupMap()
    }
    
    private func setupSearchField() {
//        view.addSubviews(searchTextfield)
    }
    
    private func setupMap() {
        view.addSubviews(mapView)
        
        // Set initial location in Moscow
        let initialLocation = CLLocation(latitude: 55.751244, longitude: 37.618423)
        mapView.centerToLocation(initialLocation)

    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func searchByFlightNumberButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByFightNumber()
    }
    
    @objc func searchByAirportTimeTableButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByAirportTimetable()
    }
}

extension SearchRootViewController {
    func searchFor(_ searchText: String) {
        
    }
    
    func stopSearch() {
//        resultOfsearchViewController.stop()
        searchController.showsSearchResultsController = false
        searchController.searchBar.searchTextField.backgroundColor = nil
    }
}

extension SearchRootViewController: SearchViewInput {
    
}

extension SearchRootViewController: UISearchBarDelegate {
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

extension SearchRootViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
    
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 100000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
