//
//  StandartSearchController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.10.2022.
//

import UIKit

class StandartSearchController: UISearchController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        obscuresBackgroundDuringPresentation = false
        searchBar.placeholder = "Find a plane"
        searchBar.searchTextField.textColor = UIColor.appColor(.textColor)
    }
}
