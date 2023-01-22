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
        
        let presenter = LiveFlightByAirlinePresenter()
        presenter.output = output.outputScreen
        
        let view = LiveFlightByAirlineViewController(
            output: presenter
        )
    
        view.output = presenter
        presenter.view = view
        
        return AssemblyResult(view: view, input: presenter)
        
    }
}
