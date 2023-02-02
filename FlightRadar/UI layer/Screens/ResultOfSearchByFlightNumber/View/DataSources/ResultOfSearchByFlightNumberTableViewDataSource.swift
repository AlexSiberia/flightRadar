//
//  ResultOfSearchByFlightNumberTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

extension TableViewDataSource where Model == FlightNumberPresentationModel, Cell == ResultOrSearchByFlightNumberFlightTableViewCell {
    
    static func make(
        for flights: [FlightNumberPresentationModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: flights
        )
    }
}

extension TableViewDataSource where Model == AirlinePresentationModel, Cell == ResultOrSearchByFlightNumberAirlinesTableViewCell {
    
    static func make(
        for airlines: [AirlinePresentationModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: airlines
        )
    }
}
