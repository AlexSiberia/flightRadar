//
//  ResultOfSearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import Foundation

struct ResultOfSearchByFlightNumberScreenContext {
    let searchString: String
    var sortParams: [String: Any]?
    
    var results: [FlightNumberModel]?
}

class ResultOfSearchByFlightNumberAssembly: Assembly {
    func create(
        output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<ResultOfSearchByFlightNumberViewController, ResultsOfSearchByFlightNumberScreenInput> {
        let presenter = ResultOfSearchByFlightNumberPresenter()
        presenter.output = output.outputScreen
        
        let view = ResultOfSearchByFlightNumberViewController(presenter: presenter)
    
        view.presenter = presenter
        presenter.view = view
        
        return AssemblyResult(view: view, input: presenter)
    }
}
