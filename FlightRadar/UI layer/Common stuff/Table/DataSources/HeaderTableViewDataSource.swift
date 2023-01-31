//
//  HeaderTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.01.2023.
//

import UIKit

extension TableViewDataSource where Model == HeaderModel, Cell == HeaderTableViewCell {
    
    static func make(
        for headers: [HeaderModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: headers
        )
    }
}
