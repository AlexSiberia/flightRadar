//
//  ResultOfSearchByFlightNumberAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import Foundation

class  ResultOfSearchByFlightNumberAssembly {
    
    func create() -> ResultOfSearchByFlightNumberViewController {
        let presenter = ResultOfSearchByFlightNumberPresenter()
        let view = ResultOfSearchByFlightNumberViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
