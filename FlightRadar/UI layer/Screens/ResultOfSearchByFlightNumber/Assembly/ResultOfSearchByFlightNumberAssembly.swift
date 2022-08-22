//
//  ResultOfSearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import Foundation

struct ResultOfSearchByFlightNumberScreenContext {
    
}

class ResultOfSearchByFlightNumberAssembly: Assembly {
    func create(
//        context: ResultOfSearchByFlightNumberScreenContext = ResultOfSearchByFlightNumberScreenContext(),
        output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<ResultOfSearchByFlightNumberViewController, ResultsOfSearchByFlightNumberScreenInput> {
        let presenter = ResultOfSearchByFlightNumberPresenter()
//        presenter.context = context
        presenter.output = output.outputScreen
        
        let view = ResultOfSearchByFlightNumberViewController()
    
        view.presenter = presenter
        presenter.view = view
        
        return AssemblyResult(view: view, input: presenter)
    }
    
//    typealias View = ResultOfSearchByFlightNumberViewController
//    
//    typealias InputScreen = ResultsOfSearchByFlightNumberScreenInput
//    
//    typealias OutputScreen = ResultOfSeacrhByFlightNumberScreenOutput
    
}
