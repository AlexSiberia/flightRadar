import UIKit

protocol SearchCoordinatorOutput: AnyObject {
    func didSelectSearchByFightNumber()
    func didSelectSearchByAirportTimetable()
}

final class SearchCoordinator: AppCoordinator {
    
    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    var serviceLocator: ServiceLocator
    weak var output: SearchCoordinatorOutput? = nil
    
    weak var resultScreenInput: ResultsOfSearchByFlightNumberScreenInput?
    
    // MARK: - Initialization
    
    init(
        transitionHandler: UINavigationController?,
        serviceLocator: ServiceLocator
    ) {
        self.transitionHandler = transitionHandler
        self.serviceLocator = serviceLocator
        
        print("Create search coordinator")
    }
    
    // MARK: - Public
    
    func start() {
        showSearchRoot()
    }
    
    // MARK: - Private
    
    fileprivate func showSearchRoot() {
        let resultOfSearchScreen = ResultOfSearchByFlightNumberAssembly().create(
            output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        let searchController = UISearchController(
            searchResultsController: resultOfSearchScreen.view
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
        resultScreenInput?.update(searchString)
    }
}

extension SearchCoordinator: ResultOfSeacrhByFlightNumberScreenOutput {
    
    func didSelect(flight: FlightNumberModel) {
//        output?.didSelectSearchByFlight()
    }
    
    func didSelect(airline: AirlineModel) {
        
    }
}
