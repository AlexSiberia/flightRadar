//
//  SearchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit
import MapKit
import CoreLocationUI
import CoreLocation

struct MapViewData {
    let airports: [AirportModel]
}

class SearchRootViewController: BaseViewController {
    
    fileprivate var mapViewData: MapViewData = MapViewData(airports: [])
    
    var output: SearchViewOutput?
    let searchController: StandartSearchController
    
    // MARK: - Subviews
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    private lazy var locationButton: UIButton = {
        
        let action = UIAction { [unowned self] _ in
            self.didTapLocationButton()
        }
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.image = UIImage(systemName: "location.fill")
 
        buttonConfiguration.baseBackgroundColor = UIColor.appColor(.backgroundColor)
        buttonConfiguration.baseForegroundColor = UIColor.appColor(.textColor)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        buttonConfiguration.cornerStyle = .small
       
        
        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var zoomPlusButton: UIButton = {
        
        let action = UIAction { [unowned self] _ in
            self.didTapZoomPlusButton()
        }
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.image = UIImage(systemName: "plus")
        
        buttonConfiguration.baseBackgroundColor = UIColor.appColor(.backgroundColor)
        buttonConfiguration.baseForegroundColor = UIColor.appColor(.textColor)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        buttonConfiguration.cornerStyle = .small
        
        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var zoomMimusButton: UIButton = {
        
        let action = UIAction { [unowned self] _ in
            self.didTapZoomMinusButton()
        }
    
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.image = UIImage(systemName: "minus")
        
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
        
        output?.didLoadView()
        
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
        setupButtons()
    }
    
    private func setupSearchField() {

    }
    
    private func setupMap() {
        view.addSubviews(mapView)
        
        // Set initial location in Tashkent
        let initialLocation = CLLocationCoordinate2D(latitude: 41.311081, longitude: 69.240562)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        // Added airports pins
        mapView.addAnnotations(mapViewData.airports)
    }
    
    private func setupButtons() {
        mapView.addSubview(locationButton)
        mapView.addSubview(zoomPlusButton)
        mapView.addSubview(zoomMimusButton)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            locationButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50),
            locationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -5),
            locationButton.widthAnchor.constraint(equalToConstant: 45),
            locationButton.heightAnchor.constraint(equalToConstant: 45),
            
            zoomPlusButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 10),
            zoomPlusButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -5),
            zoomPlusButton.widthAnchor.constraint(equalToConstant: 45),
            zoomPlusButton.heightAnchor.constraint(equalToConstant: 45),
            
            zoomMimusButton.topAnchor.constraint(equalTo: zoomPlusButton.bottomAnchor, constant: 2),
            zoomMimusButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -5),
            zoomMimusButton.widthAnchor.constraint(equalToConstant: 45),
            zoomMimusButton.heightAnchor.constraint(equalToConstant: 45),
 
        ])
    }
    
    @objc func searchByFlightNumberButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByFightNumber()
    }
    
    @objc func searchByAirportTimeTableButtonAction(sender: UIButton!) {
//        output?.didSelectSearchByAirportTimetable()
    }
    
    @objc func didTapLocationButton() {
        locationButton.isEnabled = false
        output?.didAskToObtainCurrentLocation()
    }
    
    @objc func didTapZoomPlusButton() {
        var span = mapView.region.span
        span = MKCoordinateSpan(latitudeDelta: span.latitudeDelta / 1.5, longitudeDelta: span.longitudeDelta / 1.5)
        mapView.setRegion(MKCoordinateRegion(center: mapView.region.center, span: span), animated: true)
    }
    
    @objc func didTapZoomMinusButton() {
        var span = mapView.region.span
        span = MKCoordinateSpan(latitudeDelta: span.latitudeDelta * 1.5, longitudeDelta: span.longitudeDelta * 1.5)
        mapView.setRegion(MKCoordinateRegion(center: mapView.region.center, span: span), animated: true)
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
    
    func showAirportsPin(_ pins: MapViewData) {
        mapViewData = pins
    }
    
    func didObtain(currentLocation: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        mapView.setRegion(region, animated: true)

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
