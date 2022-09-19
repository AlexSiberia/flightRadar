//
//  SearchScreenAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import UIKit

class SearchScreenAssembly: Assembly {
    
    func create(
        output: OutputScreenContainer<SearchScreenOutput>,
        serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchRootViewController, SearchScreenInput> {
        return create(
            output: output,
            serviceLocator: serviceLocator,
            searchController: nil
        )
    }
    
    func create(
        output: OutputScreenContainer<SearchScreenOutput>,
        serviceLocator: ServiceLocator,
        searchController: UISearchController? = nil
    ) -> AssemblyResult<SearchRootViewController, SearchScreenInput> {
        
        guard let searchController = searchController else {
            fatalError()
        }
        
        let presenter = SearchScreenPresenter()
        let view = SearchRootViewController(
            presenter: presenter,
            searchController: searchController
        )
        
        view.output = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
