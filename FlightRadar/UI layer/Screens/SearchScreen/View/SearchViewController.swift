//
//  SearchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit
import MapKit

class SearchViewController: BaseViewController {
    
    var presenter: SearchScreenPresenter
    var output: SearchViewOutput?
    lazy var resultOfsearchViewController: ResultOfSearchByFlightNumberViewController = {
        let resultOfsearchViewController = ResultOfSearchByFlightNumberViewController(presenter: ResultOfSearchByFlightNumberPresenter())
        
        
        return resultOfsearchViewController
    }()
    
    // MARK: - Subviews
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: resultOfsearchViewController)
        
        return searchController
    }()
    
    lazy var searchTextfield: UITextField = { [unowned self] in
        let searchTextfield = UITextField()
        
        searchTextfield.backgroundColor = .white
        searchTextfield.delegate = self
        
        searchTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        return searchTextfield
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    
    init(presenter: SearchScreenPresenter) {
        self.presenter = presenter
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
        
        searchController.searchResultsUpdater = self

//        presenter.output?.didSelectSearchByFightNumber()
    }
    
    private func setupView() {
        title = "Find a plane"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)

        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
        
        // Create searchController and tune it
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find a plane"
        searchController.searchBar.searchTextField.textColor = UIColor.appColor(.textColor)
    
        // Change background color
        navigationController?.navigationBar.backgroundColor = .darkGray
    }
    
    private func setupSubviews() {
        setupSearchField()
        setupMap()
    }
    
    private func setupSearchField() {
        view.addSubviews(searchTextfield)
    }
    
    private func setupMap() {
        view.addSubviews(mapView)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            searchTextfield.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 20
            ),
            searchTextfield.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 20
            ),
            searchTextfield.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -20
            ),
            mapView.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor),
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

extension SearchViewController: SearchViewInput {
    
}

extension SearchViewController: UITextFieldDelegate {
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
    
    
}
