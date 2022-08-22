//
//  SearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class SearchByFlightNumberAssembly: Assembly {
    
    func create(output: OutputScreenContainer<SearchByFlihgtNumberOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchByFlightNumberViewController, SearchByFlightNumberInput> {
        let presenter = SearchByFlightNumberPresenter()
        let view = SearchByFlightNumberViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output.outputScreen
        return AssemblyResult(view: view, input: presenter)
    }
}
