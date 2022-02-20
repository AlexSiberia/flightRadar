//
//  TimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class TimeTableAssembly {
    
    func create() -> AirportTimeTableViewController {
        let presenter = TimeTablePresenter()
        let view = AirportTimeTableViewController()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
