//
//  FlightByRouteAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 16.01.2023.
//

import UIKit

class FlightByRouteAssembly: Assembly {
    
    func create(output: OutputScreenContainer<FlightByRouteScreenOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<FlightByRouteController, FlightByRouteScreenInput> {
      return create(
        output: output,
        serviceLocator: serviceLocator,
        searchController: nil
       )
        
    }
    
    
    func create(output: OutputScreenContainer<FlightByRouteScreenOutput>,
                serviceLocator: ServiceLocator,
                searchController: StandartSearchController? = nil
    ) -> AssemblyResult<FlightByRouteController, FlightByRouteScreenInput> {
        
        guard let searchController = searchController else {
            fatalError()
        }
        
        let presenter = FlightByRoutePresenter()
            
        let view = FlightByRouteController(
            output: presenter,
            searchController: searchController
        )
        
        searchController.searchResultsUpdater = view
        
        view.output = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
