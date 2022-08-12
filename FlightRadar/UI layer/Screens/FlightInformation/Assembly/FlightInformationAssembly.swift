//
//  FlightInformationAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class FlightInformationAssembly {
    
    func create(output: FlightInformationOutput) -> FlightInformationViewController {
        let presenter = FlightInformationPresenter()
        let view = FlightInformationViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.output = output
        
        return view
    }
}
