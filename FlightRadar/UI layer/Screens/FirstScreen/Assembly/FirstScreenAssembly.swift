//
//  FirstScreenAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation

class FirstScreenAssembly {
    
    func create(output: FirstScreenOutput) -> FirstViewController {
        
        let presenter = FirstScreenPresenter()
        let view = FirstViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.output = output
        
        return view
    }
}
