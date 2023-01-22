//
//  FlightByRouteController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 16.01.2023.
//

import UIKit

class FlightByRouteController: BaseViewController {

    var output: FlightByRouteViewOutput?

    
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
    
    private lazy var label: UILabel = {
        
        label = UILabel()
        label.text = "Search by city, airport name, IATA or ICAO code"
        label.textColor = UIColor.appColor(.textColor)
//        label.font = UIFont.systemFont(ofSize: 50).boldItalics()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var departureTextField: UITextField = {
        
        departureTextField = UITextField()
        departureTextField.placeholder = "Departure airport"
        departureTextField.textColor = UIColor.appColor(.textColor)
        departureTextField.font = UIFont.systemFont(ofSize: 20)
        departureTextField.keyboardType = UIKeyboardType.default
        departureTextField.returnKeyType = UIReturnKeyType.search
        departureTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        departureTextField.autocorrectionType = UITextAutocorrectionType.no
        departureTextField.leftViewMode = UITextField.ViewMode.always
        departureTextField.leftView = departureIconViewLeftView
        // Change search incon color
        departureTextField.tintColor = UIColor.appColor(.textColor)
        departureTextField.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        departureTextField.layer.cornerRadius = 10.0
        departureTextField.layer.borderWidth = 2
        departureTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return departureTextField
    }()
    
    // Add search icon - magnifyingglass
    lazy var departureIconView: UIImageView = {
        
        let iconImage = UIImage(systemName: "magnifyingglass")
        let iconView = UIImageView(image: iconImage)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    lazy var departureIconViewLeftView: UIView = {
        let iconViewLeftView = UIView()
        iconViewLeftView.translatesAutoresizingMaskIntoConstraints = false
        return iconViewLeftView
    }()
    
    private lazy var departureTextField: UITextField = {
        
        departureTextField = UITextField()
        departureTextField.placeholder = "Departure airport"
        departureTextField.textColor = UIColor.appColor(.textColor)
        departureTextField.font = UIFont.systemFont(ofSize: 20)
        departureTextField.keyboardType = UIKeyboardType.default
        departureTextField.returnKeyType = UIReturnKeyType.search
        departureTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        departureTextField.autocorrectionType = UITextAutocorrectionType.no
        departureTextField.leftViewMode = UITextField.ViewMode.always
        departureTextField.leftView = departureIconViewLeftView
        // Change search incon color
        departureTextField.tintColor = UIColor.appColor(.textColor)
        departureTextField.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        departureTextField.layer.cornerRadius = 10.0
        departureTextField.layer.borderWidth = 2
        departureTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return departureTextField
    }()
    
    // Add search icon - magnifyingglass
    lazy var departureIconView: UIImageView = {
        
        let iconImage = UIImage(systemName: "magnifyingglass")
        let iconView = UIImageView(image: iconImage)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    lazy var departureIconViewLeftView: UIView = {
        let iconViewLeftView = UIView()
        iconViewLeftView.translatesAutoresizingMaskIntoConstraints = false
        return iconViewLeftView
    }()
    
    lazy var searchButton: UIButton = {
        searchButton = UIButton(type: .system)
        searchButton.setTitle("Search", for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        searchButton.setTitleColor(UIColor.appColor(.textColor), for: .normal)
        searchButton.backgroundColor = UIColor.appColor(.backgroundColor)
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.borderWidth = 2.0
        searchButton.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        searchButton.translatesAutoresizingMaskIntoConstraints = false
       

        return searchButton
    }()
    
    // MARK: Initialization
    
    init(
        output: FlightByRouteViewOutput
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
        setupNavigationBar()
    }
    
    private func setupSubviews() {
        view.addSubview(label)
        view.addSubview(departureTextField)
        
        departureIconViewLeftView.addSubview(departureIconView)
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
            
            label.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            
            departureTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            departureTextField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 5),
            departureTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -5),
            departureTextField.heightAnchor.constraint(equalToConstant: 40),
            
            departureIconViewLeftView.centerXAnchor.constraint(equalTo: departureTextField.leftView!.safeAreaLayoutGuide.centerXAnchor),
            departureIconViewLeftView.centerYAnchor.constraint(equalTo: departureTextField.leftView!.safeAreaLayoutGuide.centerYAnchor),
            departureIconViewLeftView.widthAnchor.constraint(equalToConstant: 25),
            departureIconViewLeftView.heightAnchor.constraint(equalToConstant: 50),
            
            departureIconView.leadingAnchor.constraint(equalTo: departureIconViewLeftView.safeAreaLayoutGuide.leadingAnchor, constant:  3),
            departureIconView.centerYAnchor.constraint(equalTo: departureIconViewLeftView.safeAreaLayoutGuide.centerYAnchor),
         
 
        ])
    }
}

extension FlightByRouteController: FlightByRouteViewInput {
    
}

extension FlightByRouteController {
    func searchFor(_ searchText: String) {
        
    }
    
    func stopSearch() {
        searchController.showsSearchResultsController = false
        searchController.searchBar.searchTextField.backgroundColor = nil
    }
}

extension FlightByRouteController: UISearchBarDelegate {
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

//extension FlightByRouteController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        searchController.showsSearchResultsController = true
//    }
//}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension FlightByRouteController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    
    }
 }
