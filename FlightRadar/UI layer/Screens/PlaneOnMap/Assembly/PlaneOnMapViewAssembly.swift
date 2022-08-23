//
//  PlaneOnMapViewAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class PlaneOnMapViewAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<PlaneOnMapOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<PlaneOnMapViewController, PlaneOnMapInput> {
        let presenter = PlaneOnMapViewPresenter()
        let view = PlaneOnMapViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
