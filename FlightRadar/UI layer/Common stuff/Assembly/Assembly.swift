//
//  Assembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 15.08.2022.
//

import Foundation
import UIKit

class OutputScreenContainer<OutputScreen> {
    var outputScreen: OutputScreen
    
    init(outputScreen: OutputScreen) {
        self.outputScreen = outputScreen
    }
}

struct AssemblyResult<View, InputScreen> {
    let view: View
    let input: InputScreen
}

protocol Assembly {
    associatedtype View: UIViewController
    associatedtype InputScreen
    associatedtype OutputScreen
    
    func create(
        output: OutputScreenContainer<OutputScreen>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<View, InputScreen>
}
