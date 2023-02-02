//
//  LiveFlightByAirlineAirlineTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.01.2023.
//

import UIKit

extension TableViewDataSource where Model == AirlineListPresentationModel, Cell == LiveFlightByAirlineAirlineTableViewCell {
    
    static func make(
        for airlines: [AirlineListPresentationModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: airlines
        )
    }
}

extension TableViewDataSource where Model == AirlineListHeaderPresentationModel, Cell == LiveFlightByAirlineHeaderTableViewCell {
    
    static func make(
        for headers: [AirlineListHeaderPresentationModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: headers
        )
    }
}
