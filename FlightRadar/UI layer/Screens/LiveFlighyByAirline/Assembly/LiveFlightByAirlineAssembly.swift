//
//  LiveFlightByAirlineAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import Foundation

class LiveFlightByAirlineAssembly: Assembly {
    
    func create(output: OutputScreenContainer<LiveFlightByAirlineScreenOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<LiveFlightByAirlineViewController, LiveFlightByAirlineScreenInput> {
      return create(
        output: output,
        serviceLocator: serviceLocator,
        searchController: nil
       )
        
    }
    
    func create(
        output: OutputScreenContainer<LiveFlightByAirlineScreenOutput>,
        serviceLocator: ServiceLocator,
        searchController: StandartSearchController? = nil
    ) -> AssemblyResult<LiveFlightByAirlineViewController, LiveFlightByAirlineScreenInput> {
        
        guard let searchController = searchController else {
            fatalError()
        }
        
        let presenter = LiveFlightByAirlinePresenter()
        presenter.output = output.outputScreen
        
        let view = LiveFlightByAirlineViewController(
            output: presenter,
            searchController: searchController
        )
    
        view.output = presenter
        presenter.view = view
        
        return AssemblyResult(view: view, input: presenter)
    }
}
