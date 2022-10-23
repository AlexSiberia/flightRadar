//
//  SearchViewOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.08.2022.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    
    func didLoadView()
    
    func didAskToObtainCurrentLocation()

}


