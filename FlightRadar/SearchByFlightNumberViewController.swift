//
//  LaunchViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 15.01.2022.
//

import UIKit

class SearchByFlightNumberViewController: UIViewController {
    
    var label: UILabel!
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title on controller
        title = "Search by flight number"
        
        let backgroundColor = UIColor.appColor(.backgroundColor)
        view.backgroundColor = backgroundColor
        
//        let labelText = "Find a Plane"
//        let atributedText = NSMutableAttributedString(string: labelText)
        
        label = UILabel()
        label.text = "Find a Plane"
        label.textColor = UIColor.appColor(.textColor)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        textField = UITextField()
        textField.placeholder = "Flight number"
        textField.textColor = UIColor.appColor(.textColor)
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.search
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.leftViewMode = UITextField.ViewMode.always
        
        // Add search icon - magnifyingglass
        let iconImage = UIImage(systemName: "magnifyingglass")
        let iconView = UIImageView(image: iconImage)
        let iconViewLeftView = UIView()
      
        iconViewLeftView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconViewLeftView.addSubview(iconView)
        
        textField.leftView = iconViewLeftView

        // Change search incon color
        textField.tintColor = UIColor.appColor(.textColor)
        // textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        textField.layer.cornerRadius = 10.0
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
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
