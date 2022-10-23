//
//  StandartSearchController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.10.2022.
//

import UIKit

class StandartSearchController: UISearchController {
    
    // MARK: Life cycle
    
    init(
        searchResultController: UIViewController?,
         placeholder: String = ""
    ) {
        super.init(searchResultsController: searchResultController)
            
        obscuresBackgroundDuringPresentation = false
        searchBar.placeholder = placeholder
        searchBar.searchTextField.textColor = UIColor.appColor(.textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
