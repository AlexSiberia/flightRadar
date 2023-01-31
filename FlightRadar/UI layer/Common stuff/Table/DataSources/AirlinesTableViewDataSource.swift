//
//  AirlinesTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.01.2023.
//

import UIKit

extension TableViewDataSource where Model == AirlineModel, Cell == AirlinesTableViewCell {
    
    static func make(
        for airlines: [AirlineModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: airlines
        )
    }
}
