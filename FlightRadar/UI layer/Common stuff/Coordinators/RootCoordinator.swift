import UIKit

final class RootCoordinator: AppCoordinator {
  
    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    var serviceLocator: ServiceLocator
    
    // MARK: - Initialization
    
    init(
        transitionHandler: UINavigationController,
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
    
    fileprivate func showFirstScreeen() {
        let assemblyResult = FirstScreenAssembly().create(
            output: OutputScreenContainer<FirstScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        print("Will show FirstScreen")
        transitionHandler?.viewControllers = [assemblyResult.view]

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
        let assemblyResult = ResultOfSearchByFlightNumberAssembly().create(
            output: OutputScreenContainer<ResultOfSeacrhByFlightNumberScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator
        )
        
        let context = ResultOfSearchByFlightNumberScreenContext(
            searchString: "Стамбул",
            sortParams: nil,
            results: nil
        )
        assemblyResult.input.update(context)
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
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
        showFirstScreeen()
    }
}

extension RootCoordinator: FirstScreenOutput {
    func didSelectSearchByAirportTimetable() {
        showSearchByAirportTimetable()
    }
    
    func didSelectSearchByFightNumber() {
        showSearchByFlightNumberViewController()
    }
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
    func didSelect(flight: FlightNumberModel) {
        
    }
    
    func didSelect(airline: AirlineModel) {
        
    }
    
 
}
