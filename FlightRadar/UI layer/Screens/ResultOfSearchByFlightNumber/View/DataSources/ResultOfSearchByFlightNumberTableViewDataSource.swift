//
//  ResultOfSearchByFlightNumberTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

extension TableViewDataSource where Model == FlightNumberModel, Cell == ResultOrSearchByFlightNumberFlightTableViewCell {
    
    static func make(
        for flights: [FlightNumberModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: flights
        )
    }
}
