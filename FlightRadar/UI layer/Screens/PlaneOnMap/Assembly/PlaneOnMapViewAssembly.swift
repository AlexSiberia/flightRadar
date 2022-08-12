//
//  PlaneOnMapViewAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class PlaneOnMapViewAssembly {
    
    func create(output: PlaneOnMapOutput) -> PlaneOnMapViewController {
        
        let presenter = PlaneOnMapViewPresenter()
        let view = PlaneOnMapViewController()
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
