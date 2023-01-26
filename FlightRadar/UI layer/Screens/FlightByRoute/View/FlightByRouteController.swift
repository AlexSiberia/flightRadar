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
        departureTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        departureTextField.font = UIFont.systemFont(ofSize: 20)
        departureTextField.keyboardType = UIKeyboardType.default
        departureTextField.returnKeyType = UIReturnKeyType.search
        departureTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        departureTextField.autocorrectionType = UITextAutocorrectionType.no
        departureTextField.leftViewMode = UITextField.ViewMode.always
        departureTextField.leftView = departureIconViewLeftView
        departureTextField.layer.cornerRadius = 10.0
        departureTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return departureTextField
    }()
    
    // Add search icon
    lazy var departureIconView: UIImageView = {
        
        let iconImage = UIImage(systemName: "airplane.departure")
        let iconView = UIImageView(image: iconImage)
        // Change search incon color
        iconView.tintColor = .gray
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconView
    }()
    
    lazy var departureIconViewLeftView: UIView = {
        let iconViewLeftView = UIView()
        iconViewLeftView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconViewLeftView
    }()
    
    private lazy var arrivalTextField: UITextField = {
        
        arrivalTextField = UITextField()
        arrivalTextField.placeholder = "Arrival airport"
        arrivalTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        arrivalTextField.font = UIFont.systemFont(ofSize: 20)
        arrivalTextField.keyboardType = UIKeyboardType.default
        arrivalTextField.returnKeyType = UIReturnKeyType.search
        arrivalTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        arrivalTextField.autocorrectionType = UITextAutocorrectionType.no
        arrivalTextField.leftViewMode = UITextField.ViewMode.always
        arrivalTextField.leftView = arrivalIconViewLeftView
        arrivalTextField.layer.cornerRadius = 10.0
        arrivalTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return arrivalTextField
    }()
//    
    // Add search icon - magnifyingglass
    lazy var arrivalIconView: UIImageView = {
        
        let iconImage = UIImage(systemName: "airplane.arrival")
        let iconView = UIImageView(image: iconImage)
        // Change search incon color
        iconView.tintColor = .gray
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconView
    }()
    
    lazy var arrivalIconViewLeftView: UIView = {
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
        searchButton.layer.borderWidth = 1.0
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
//
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
    }
    
    private func setupSubviews() {
        view.addSubview(label)
        view.addSubview(departureTextField)
        view.addSubview(arrivalTextField)
        view.addSubview(searchButton)
        
        departureIconViewLeftView.addSubview(departureIconView)
        arrivalIconViewLeftView.addSubview(arrivalIconView)
    }
    
    private func setupSearchField() {

    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 10),
       
            departureTextField.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: 10
            ),
            departureTextField.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 10
            ),
            departureTextField.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -10
            ),
            departureTextField.heightAnchor.constraint(equalToConstant: 40),

            departureIconViewLeftView.heightAnchor.constraint(equalToConstant: 40),
            
            departureIconView.leadingAnchor.constraint(
                equalTo: departureIconViewLeftView.safeAreaLayoutGuide.leadingAnchor,
                constant:  5
            ),
            departureIconView.trailingAnchor.constraint(
                equalTo: departureIconViewLeftView.safeAreaLayoutGuide.trailingAnchor,
                constant:  -5
            ),
            departureIconView.centerYAnchor.constraint(equalTo: departureIconViewLeftView.safeAreaLayoutGuide.centerYAnchor),
            
            arrivalTextField.topAnchor.constraint(
                equalTo: departureTextField.bottomAnchor,
                constant: 10
            ),
            arrivalTextField.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 10
            ),
            arrivalTextField.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -10
            ),
            arrivalTextField.heightAnchor.constraint(equalToConstant: 40),

            arrivalIconViewLeftView.heightAnchor.constraint(equalToConstant: 40),

            arrivalIconView.leadingAnchor.constraint(
                equalTo: arrivalIconViewLeftView.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            arrivalIconView.trailingAnchor.constraint(
                equalTo: arrivalIconViewLeftView.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            arrivalIconView.centerYAnchor.constraint(equalTo: arrivalIconViewLeftView.safeAreaLayoutGuide.centerYAnchor),
            
            searchButton.topAnchor.constraint(
                equalTo: arrivalTextField.bottomAnchor,
                constant: 10
            ),
            searchButton.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 10
            ),
            searchButton.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -10
            ),
        ])
    }
}

extension FlightByRouteController: FlightByRouteViewInput {
    
}

extension FlightByRouteController {
    func searchFor(_ searchText: String) {
        
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
    }
}


// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension FlightByRouteController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    
    }
 }
