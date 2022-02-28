//
//  LaunchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 15.01.2022.
//

import UIKit

class SearchByFlightNumberViewController: BaseViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
        // Add title on controller
        title = "Search by flight number"
    }
    
    
    private func setupSubviews() {
        view.addSubviews(label, textField)
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
        ])
        
    }
    
}
