//
//  FlightInformationAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class FlightInformationAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<FlightInformationOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<FlightInformationViewController, FlightInformationInput> {
        let presenter = FlightInformationPresenter()
        let view = FlightInformationViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
