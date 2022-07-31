//
//  ResultOfSearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import Foundation

struct ResultOfSearchByFlightNumberScreenContext {
    
}

class ResultOfSearchByFlightNumberAssembly {
    
    func create(
        context: ResultOfSearchByFlightNumberScreenContext = ResultOfSearchByFlightNumberScreenContext(),
        output: ResultOfSeacrhByFlightNumberScreenOutput? = nil
    ) -> (
        ResultsOfSearchByFlightNumberScreenInput,
        ResultOfSearchByFlightNumberViewController
    ) {
        
        let presenter = ResultOfSearchByFlightNumberPresenter()
        presenter.context = context
        presenter.output = output
        
        let view = ResultOfSearchByFlightNumberViewController()
    
        view.presenter = presenter
        presenter.view = view
        
        return (presenter, view)
    }
}
