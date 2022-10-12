//
//  TimeTableAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class TimeTableAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<TimeTableOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<AirportTimeTableViewController, TimeTableInput> {
        let presenter = TimeTablePresenter()
        let view = AirportTimeTableViewController(presenter: presenter)
        
        view.presenter = presenter
        presenter.view = view
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
