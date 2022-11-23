//
//  SearchScreenAssembly.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import UIKit

class SearchScreenAssembly: Assembly {
    
    func create(output: OutputScreenContainer<SearchScreenOutput>,
                serviceLocator: ServiceLocator
    ) -> AssemblyResult<SearchRootViewController, SearchScreenInput> {
      return create(
        output: output,
        serviceLocator: serviceLocator,
        searchController: nil
       )
        
    }
    
    
    func create(output: OutputScreenContainer<SearchScreenOutput>,
                serviceLocator: ServiceLocator,
                searchController: StandartSearchController? = nil
    ) -> AssemblyResult<SearchRootViewController, SearchScreenInput> {
        
        guard let searchController = searchController else {
            fatalError()
        }
        
        let presenter = SearchScreenPresenter()
        
        var locationService = serviceLocator.resolve(LocationServiceProtocol.self)
        presenter.locationService = locationService
        locationService.delegate = presenter
            
        
        let view = SearchRootViewController(
            output: presenter,
            searchController: searchController
        )
        
        searchController.searchResultsUpdater = view
        
        view.output = presenter
        presenter.view = view
        
        presenter.output = output.outputScreen
        
        return AssemblyResult(view: view, input: presenter)
    }
}
