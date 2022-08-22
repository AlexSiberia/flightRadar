//
//  PlaneInformationAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class PlaneInformationAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<PlaneInformationOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<PlaneInformationViewController, PlaneInformationInput> {
        let presenter = PlaneInformationPresenter()
        let view = PlaneInformationViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
