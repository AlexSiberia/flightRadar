//
//  SearchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit
import MapKit
import CoreLocationUI

class SearchRootViewController: BaseViewController {
    
    var output: SearchViewOutput?
    let searchController: StandartSearchController
    
    // MARK: - Subviews
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    private lazy var locationButton: UIButton = {
        
        let action = UIAction{ [unowned self] _ in
            self.didTapButton()
        }
        
//        let largeFont = UIFont.systemFont(ofSize: 20)
//        let imageConfiguration = UIImage.SymbolConfiguration(font: largeFont)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.image = UIImage(systemName: "location.fill")
//                                            , withConfiguration: imageConfiguration)
        buttonConfiguration.buttonSize = .mini
        buttonConfiguration.baseBackgroundColor = UIColor.appColor(.backgroundColor)
        buttonConfiguration.baseForegroundColor = UIColor.appColor(.textColor)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        buttonConfiguration.cornerStyle = .small
       
        
        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(
        output: SearchViewOutput,
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
        title = "Find a plane"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
        
        // Hide back button
        navigationItem.hidesBackButton = true

        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
        
        // Setup search
        navigationItem.searchController = searchController
    }
    
    private func setupSubviews() {
        setupMap()
        setupButton()
    }
    
    private func setupSearchField() {

    }
    
    private func setupMap() {
        view.addSubviews(mapView)
        
        // Set initial location in Tashkent
        let initialLocation = CLLocation(latitude: 41.311081, longitude: 69.240562)
        mapView.centerToLocation(initialLocation)
    }
    
    private func setupButton() {
        mapView.addSubview(locationButton)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            locationButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 5),
            locationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -5),
//            locationButton.heightAnchor.constraint(equalTo: locationButton.widthAnchor),
//            locationButton.widthAnchor.constraint(equalToConstant: 44.0),

            
        
        ])
    }
    
    @objc func searchByFlightNumberButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByFightNumber()
    }
    
    @objc func searchByAirportTimeTableButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByAirportTimetable()
    }
    
    @objc func didTapButton() {
        locationButton.isEnabled = false
        output?.didAskToObtainCurrentLocation()
    }
}

extension SearchRootViewController {
    func searchFor(_ searchText: String) {
        
    }
    
    func stopSearch() {
        searchController.showsSearchResultsController = false
        searchController.searchBar.searchTextField.backgroundColor = nil
    }
}

extension SearchRootViewController: SearchViewInput {
    func didObtain(currentLocation: Location) {
        mapView.centerToLocation(CLLocation(
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude
        ))
        locationButton.isEnabled = true
    }
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
