//
//  PlaneInformationAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class PlaneInformationAssembly {
    
    func create(output: PlaneInformationOutput) -> PlaneInformationViewController {
        let presenter = PlaneInformationPresenter()
        let view = PlaneInformationViewController()
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
