import UIKit

final class RootCoordinator: AppCoordinator {
  
    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    var serviceLocator: ServiceLocator
    
    weak var resultScreenInput: SearchByFlightNumberInput?
    
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
        showStartLoadingScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showStartLoadingScreen() {
        let startController = StartViewController()
        startController.output = self
        
        print("Will show StartViewController")
        transitionHandler?.pushViewController(startController, animated: false)
    }
    
    fileprivate func showSearchFlow() {
        let searchCoordinator = SearchCoordinator(
            transitionHandler: transitionHandler,
            serviceLocator: serviceLocator
        )

        child = searchCoordinator
        
        searchCoordinator.output = self
        
        searchCoordinator.start()
    }
    
    fileprivate func showFlightByRouteController() {
        let assemblyResult = FlightByRouteAssembly().create(
            output: OutputScreenContainer<FlightByRouteScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
      

//        resultScreenInput = assemblyResult.input
        
        transitionHandler?.pushViewController(
            assemblyResult.view,
            animated: true
        )
    }
    
    fileprivate func showLiveFlightByAirlineController() {
        let assemblyResult = LiveFlightByAirlineAssembly().create(
            output: OutputScreenContainer<LiveFlightByAirlineScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(
            assemblyResult.view,
            animated: false
        )
    }
    
    fileprivate func showSearchByFlightNumberViewController() {
        let assemblyResult = SearchByFlightNumberAssembly().create(
            output: OutputScreenContainer<SearchByFlihgtNumberOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showSearchByAirportTimetable() {
        let assemblyResult = SearchByAirportTimeTableAssembly().create(
            output: OutputScreenContainer<SearchByAirportTimeTablelOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showResultOfSearchByFightNumber() {
//        let assemblyResult = ResultOfSearchByFlightNumberAssembly().create(
//            output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>(outputScreen: self),
//            serviceLocator: serviceLocator
//        )
//        
//        let context = ResultOfSearchByFlightNumberScreenContext(
//            searchString: "Стамбул",
//            sortParams: nil,
//            results: nil
//        )
//        assemblyResult.input.update(context)
//        
//        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showTimeTable() {
        let assemblyResult = TimeTableAssembly().create(
            output: OutputScreenContainer<TimeTableOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
    
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showFlightInfo() {
        let assemblyResult = FlightInformationAssembly().create(
            output: OutputScreenContainer<FlightInformationOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showPlaneInfo() {
        let assemblyResult = PlaneInformationAssembly().create(
            output: OutputScreenContainer<PlaneInformationOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showPlaneOnMap() {
        let assemblyResult = PlaneOnMapViewAssembly().create(
            output: OutputScreenContainer<PlaneOnMapOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
//    fileprivate func showSomething() {
//        let closure = { [weak self] in
//            self?.showResultOfSearchByFightNumber()
//        }
//
//
//        let screen = Assambly.create(backClosure: closure, data: data)
//        screen.data = Data
//
//        transitionHandler?.pushViewController(screen, animated: false)
//    }
}


extension RootCoordinator: StartScreenOutput {
    func onFinish() {
        showSearchFlow()
    }
}

extension RootCoordinator: SearchCoordinatorOutput {
    func didSelectFlightByRoute() {
        showFlightByRouteController()
    }
    func didSelectLiveFlightByAirline() {
        showLiveFlightByAirlineController()
    }
    func didSelectByAirportByCountry() {
        showTimeTable()
    }
    
    func didSelectSearchByAirportTimetable() {
        showSearchByAirportTimetable()
    }

    func didSelectSearchByFightNumber() {
        showSearchByFlightNumberViewController()
    }
}

extension RootCoordinator: FlightByRouteScreenOutput {
    func didReceive(searchString: String) {
        
    }
}

extension RootCoordinator: LiveFlightByAirlineScreenOutput {
    
}

extension RootCoordinator: SearchByFlihgtNumberOutput {
    func didSelectSearchByFlight() {
        showResultOfSearchByFightNumber()
    }
}

extension RootCoordinator: SearchByAirportTimeTablelOutput {
    func didSelectSearchByAirport() {
        showTimeTable()
    }
}

extension RootCoordinator: TimeTableOutput {
    func didSelectFlight() {
        showFlightInfo()
    }
}

extension RootCoordinator: FlightInformationOutput {
    func didSelectPlaneInfo() {
        showPlaneInfo()
    }
    
    func didSelectPlaneOnMap() {
        showPlaneOnMap()
    }
}

extension RootCoordinator: PlaneInformationOutput {
    
}

extension RootCoordinator: PlaneOnMapOutput {
    func didSelect() {
    }
}

extension RootCoordinator: ResultOfSeacrhByFlightNumberScreenOutput {
    func didSelect(airline: String) {
        
    }
    
    func didSelect(flight: FlightNumberPresentationModel) {
        
    }
    
    func didSelect(airline: AirlinePresentationModel) {
        
    }
    
 
}
