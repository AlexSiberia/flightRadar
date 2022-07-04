//
//  ResultOfSearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import Foundation

class ResultOfSearchByFlightNumberAssembly {
    
    func create(
        _ output: ResultOfSeacrhByFlightNumberScreenOutput? = nil
    ) -> ResultOfSearchByFlightNumberViewController {
        
        let presenter = ResultOfSearchByFlightNumberPresenter()
        presenter.output = output
        
        let view = ResultOfSearchByFlightNumberViewController()
    
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
