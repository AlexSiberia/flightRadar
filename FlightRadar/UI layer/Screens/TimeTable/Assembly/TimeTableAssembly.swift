//
//  TimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class TimeTableAssembly {
    
    func create(output: TimeTableOutput) -> AirportTimeTableViewController {
        let presenter = TimeTablePresenter()
        let view = AirportTimeTableViewController()
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
