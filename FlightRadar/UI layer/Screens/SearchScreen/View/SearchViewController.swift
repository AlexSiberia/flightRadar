//
//  SearchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit
import MapKit

class SearchViewController: BaseViewController {
    
    var output: SearchViewOutput?
    
    // MARK: - Subviews
    
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

        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
    }
    
    private func setupSubviews() {
        setupSearchField()
    }
    
    private func setupSearchField() {
        view.addSubviews(searchTextfield)
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
