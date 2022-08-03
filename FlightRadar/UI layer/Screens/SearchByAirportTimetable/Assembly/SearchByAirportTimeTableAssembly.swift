//
//  SearchByAirportTimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class SearchByAirportTimeTableAssembly {
    
    func create(output: SearchByAirportTimeTablelOutput) -> SearchByAirportTimeTableViewController {
        let presenter = SearchByAirportTimeTablePresenter()
        let view = SearchByAirportTimeTableViewController()
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output
        
        return view
    }
    
}
