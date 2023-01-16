//
//  SearchScreenByShortcutsInput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import Foundation

protocol SearchScreenByShortcutsViewInput: AnyObject {
    
    func showLoadingState()
    func showDataState(_ data: SearchScreenByShortcutsViewData)
}
