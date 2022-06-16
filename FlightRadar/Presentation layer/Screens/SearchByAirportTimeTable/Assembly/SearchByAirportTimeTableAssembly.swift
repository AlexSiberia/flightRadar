//
//  SearchByAirportTimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class SearchByAirportTimeTablePresenterAssembly {
    
    func create() -> SearchByAirportTimeTableViewController {
        let presenter = SearchByAirportTimeTablePresenter()
        let view = SearchByAirportTimeTableViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
}
