//
//  SearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class SearchByFlightNumberAssembly {
    
    func create() -> SearchByFlightNumberViewController {
        let presenter = SearchByFlightNumberPresenter()
        let view = SearchByFlightNumberViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
