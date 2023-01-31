//
//  SearchScreenByShortcutsTableViewDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import UIKit

extension TableViewDataSource where Model == ShortCutModel, Cell == SearchScreenByShortcutsShortcutTableViewCell {
    
    static func make(
        for shortcuts: [ShortCutModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: shortcuts
        )
    }
}

//extension TableViewDataSource where Model == HeaderModel, Cell == SearchScreenByShortcutsHeaderTableViewCell {
//    
//    static func make(
//        for headers: [HeaderModel]
//    ) -> TableViewDataSource {
//        TableViewDataSource(
//            models: headers
//        )
//    }
//}
