//
//  ResultOfSearchByFlightNumberTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

extension TableViewDataSource where Model == FlightNumberModel, Cell == ResultOrSearchByFlightNumberTableViewCell {
    
    static func make(
        for flightNumbers: [FlightNumberModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: flightNumbers
        ) { flightNumber, cell in
            cell.updateDataSource(with: flightNumber)
        }
    }
}
