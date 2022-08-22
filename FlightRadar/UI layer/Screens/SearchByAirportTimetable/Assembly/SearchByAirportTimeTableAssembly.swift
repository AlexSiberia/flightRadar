//
//  SearchByAirportTimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class SearchByAirportTimeTableAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<SearchByAirportTimeTablelOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchByAirportTimeTableViewController, SearchByAirportTimeTableInput> {
        let presenter = SearchByAirportTimeTablePresenter()
        let view = SearchByAirportTimeTableViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
