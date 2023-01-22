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
        
        let presenter = FlightByRoutePresenter()
            
        let view = FlightByRouteController(
            output: presenter
        )

        
        view.output = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
        
    }
}
