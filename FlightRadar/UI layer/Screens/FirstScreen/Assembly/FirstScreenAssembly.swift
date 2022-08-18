//
//  FirstScreenAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation

class FirstScreenAssembly: Assembly {
    
    func create(output: OutputScreenContainer<FirstScreenOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<FirstViewController, FirstScreenInput> {
        
        let presenter = FirstScreenPresenter()
        let view = FirstViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
