//
//  PlaneOnMapViewAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class PlaneOnMapViewAssembly {
    
    func create() -> PlaneOnMapViewController {
        
        let presenter = PlaneOnMapViewPresenter()
        let view = PlaneOnMapViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
