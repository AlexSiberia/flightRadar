//
//  LaunchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 15.01.2022.
//

import UIKit

class SearchByFlightNumberViewController: BaseViewController {
    
    var presenter: SearchByFlightNumberPresenter?
    
    lazy var label: UILabel = {
        
        label = UILabel()
        label.text = "Find a Plane"
        label.textColor = UIColor.appColor(.textColor)
        label.font = UIFont.systemFont(ofSize: 50).boldItalics()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var textField: UITextField = {
        
        textField = UITextField()
        textField.placeholder = "Flight number"
        textField.textColor = UIColor.appColor(.textColor)
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.search
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = iconViewLeftView
        // Change search incon color
        textField.tintColor = UIColor.appColor(.textColor)
        textField.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        textField.layer.cornerRadius = 10.0
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // Add search icon - magnifyingglass
    lazy var iconView: UIImageView = {
        
        let iconImage = UIImage(systemName: "magnifyingglass")
        let iconView = UIImageView(image: iconImage)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    lazy var iconViewLeftView: UIView = {
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
        searchButton.addTarget(
            self,
            action: #selector(flightInformationButtonAction),
            for: .touchUpInside)

        return searchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
        // Add title on controller
        title = "Search by flight number"
    }
    
    
    private func setupSubviews() {
        view.addSubviews(label, textField, searchButton)
        iconViewLeftView.addSubview(iconView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            textField.widthAnchor.constraint(equalToConstant: 250),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            iconViewLeftView.centerXAnchor.constraint(equalTo: textField.leftView!.safeAreaLayoutGuide.centerXAnchor),
            iconViewLeftView.centerYAnchor.constraint(equalTo: textField.leftView!.safeAreaLayoutGuide.centerYAnchor),
            iconViewLeftView.widthAnchor.constraint(equalToConstant: 25),
            iconViewLeftView.heightAnchor.constraint(equalToConstant: 50),
            
            iconView.leadingAnchor.constraint(equalTo: iconViewLeftView.safeAreaLayoutGuide.leadingAnchor, constant:  3),
            iconView.centerYAnchor.constraint(equalTo: iconViewLeftView.safeAreaLayoutGuide.centerYAnchor),
            
            searchButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 250),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    @objc func flightInformationButtonAction(sender: UIButton) {
        let searchScreen = ResultOfSearchByFlightNumberAssembly().create()
        let _ = searchScreen.0
        
        navigationController?.pushViewController(
            searchScreen.1,
            animated: true
        )
    }
    
}
