//
//  SearchScreenByShortcutsAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import Foundation

class SearchScreenByShortcutsAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<SearchScreenByShortcutsScreenOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchScreenByShortcutsViewController, SearchScreenByShortcutsScreenInput> {
        let presenter = SearchScreenByShortcutsPresenter()
        presenter.output = output.outputScreen
        
        let view = SearchScreenByShortcutsViewController(output: presenter)
    
        view.output = presenter
        presenter.view = view
        
        return AssemblyResult(view: view, input: presenter)
    }
}
   
