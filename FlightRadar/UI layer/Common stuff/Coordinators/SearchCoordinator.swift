import UIKit

protocol SearchCoordinatorOutput: AnyObject {
        func didSelectFlightByRoute()
        func didSelectLiveFlightByAirline()
        func didSelectByAirportByCountry()
        func didSelectSearchByFightNumber()
        func didSelectSearchByAirportTimetable()

}

final class SearchCoordinator: AppCoordinator {
    
    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    var serviceLocator: ServiceLocator
    weak var output: SearchCoordinatorOutput? = nil
    
//    weak var resultScreenInput: ResultsOfSearchByFlightNumberScreenInput?
    weak var resultScreenInput: SearchScreenByShortcutsScreenInput?
    
    // MARK: - Initialization
    
    init(
        transitionHandler: UINavigationController?,
        serviceLocator: ServiceLocator
    ) {
        self.transitionHandler = transitionHandler
        self.serviceLocator = serviceLocator
        print("Create coordinator")
    }
    
    // MARK: - Public
    
    func start() {
        showSearchRootAlternative()
    }
    
//    fileprivate func showSearchRoot() {
//        let resultOfSearchScreen = ResultOfSearchByFlightNumberAssembly().create(
//            output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>(outputScreen: self),
//            serviceLocator: serviceLocator
//        )
//
//        let searchController = StandartSearchController(
//            searchResultController: resultOfSearchScreen.view,
//            placeholder: "Find a plane"
//        )
//
//        let searchScreen = SearchScreenAssembly().create(
//            output: OutputScreenContainer<SearchScreenOutput>(outputScreen: self),
//            serviceLocator: serviceLocator,
//            searchController: searchController
//        )
//
//        resultScreenInput = resultOfSearchScreen.input
//
//        print("Will show SearchRoot")
//        transitionHandler?.pushViewController(
//            searchScreen.view,
//            animated: true
//        )
//    }
    
    fileprivate func showSearchRootAlternative() {
        let resultOfSearchScreen = SearchScreenByShortcutsAssembly().create(
            output: OutputScreenContainer<SearchScreenByShortcutsScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        let searchController = StandartSearchController(
            searchResultController: resultOfSearchScreen.view,
            placeholder: "Find a plane"
        )
        
        let searchScreen = SearchScreenAssembly().create(
            output: OutputScreenContainer<SearchScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator,
            searchController: searchController
        )

        resultScreenInput = resultOfSearchScreen.input
        
        print("Will show SearchRoot")
        transitionHandler?.pushViewController(
            searchScreen.view,
            animated: true
        )
    }
}

extension SearchCoordinator: SearchScreenOutput {
    func didReceive(searchString: String) {
        
    }
}

//extension SearchCoordinator: FlightByRouteScreenOutput {
//    func didReceive(searchString: String) {
//        
//    }
//}

extension SearchCoordinator: ResultOfSeacrhByFlightNumberScreenOutput {
    func didSelect(flight: FlightNumberModel) {
        output?.didSelectSearchByFightNumber()
    }
    func didSelect(airline: AirlineModel) {
        output?.didSelectSearchByAirportTimetable()
    }
    
    
}

extension SearchCoordinator: SearchScreenByShortcutsScreenOutput {
    func didSelectFlightByRoute() {
        output?.didSelectFlightByRoute()
    }
    
    func didSelectLiveFlightByAirline() {
        output?.didSelectLiveFlightByAirline()
    }
    
    func didSelectFlightByAirportByCountry() {
        output?.didSelectSearchByAirportTimetable()
    }
}
