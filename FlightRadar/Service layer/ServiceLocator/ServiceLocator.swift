//
//  ServiceLocator.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 15.08.2022.
//

import Foundation

class ServiceLocator {
    
    private let container = DependenciesContainer()
    static let shared = ServiceLocator()
    
    private init() {
    }
    
    func resolve<Service>(_ service: Service.Type) -> Service {
        guard let resolution = container.resolve(Service.self) else {
            fatalError("Can't resolve service for type \(service)")
        }
        return resolution
    }
}

fileprivate final class DependenciesContainer {
    private var resolutionMap: [String: Any] = [:]
    
    func register<Interface>(
        _ interface: Interface.Type,
        registration: () -> Interface
    ) {
        let id = String(describing: interface)
        let implementation = registration()
        resolutionMap[id] = implementation
    }
    
    func resolve<Interface>(
        _ interface: Interface.Type
    ) -> Interface? {
        let id = String(describing: interface)
        return resolutionMap[id] as? Interface
    }
}
