//
//  SearchScreenOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 07.08.2022.
//

import Foundation

protocol SearchScreenOutput: AnyObject {
    func didReceive(searchString: String)
}
