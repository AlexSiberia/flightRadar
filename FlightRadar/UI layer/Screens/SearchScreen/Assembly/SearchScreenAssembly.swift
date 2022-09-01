//
//  SearchScreenAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation

class SearchScreenAssembly: Assembly {
    
    func create(output: OutputScreenContainer<SearchScreenOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchViewController, SearchScreenInput> {
        
        let presenter = SearchScreenPresenter()
        let view = SearchViewController()
        
        view.output = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
