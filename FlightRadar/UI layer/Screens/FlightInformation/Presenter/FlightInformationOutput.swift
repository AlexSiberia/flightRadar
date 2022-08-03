//
//  FlightInformationOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 09.08.2022.
//

import Foundation

protocol FlightInformationOutput: AnyObject {
    func didSelectPlaneInfo()
    func didSelectPlaneOnMap()
}
