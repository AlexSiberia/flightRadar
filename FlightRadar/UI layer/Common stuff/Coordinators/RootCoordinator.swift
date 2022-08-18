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
    }
    
    // MARK: - Public
    
    func start() {
        showStartLoadingScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showStartLoadingScreen() {
        let startController = StartViewController()
        startController.output = self
        
        transitionHandler?.pushViewController(startController, animated: false)
    }
    
    fileprivate func showFirstScreeen() {
        let assemblyResult = FirstScreenAssembly().create(
            output: OutputScreenContainer<FirstScreenOutput>(outputScreen: self),
            serviceLocator: serviceLocator)
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showSearchByFlightNumberViewController() {
        let assemblyResult = SearchByFlightNumberAssembly().create(
            output: OutputScreenContainer<SearchByFlihgtNumberOutput>(outputScreen: self),
            serviceLocator: serviceLocator)
        
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showSearchByAirportTimetable() {
        let searchByAirportTimetable = SearchByAirportTimeTableAssembly().create(output: self)
        
        searchByAirportTimetable.presenter?.output = self
        transitionHandler?.pushViewController(searchByAirportTimetable, animated: false)
    }
    
    fileprivate func showResultOfSearchByFightNumber() {
        let resultOfSearchByFlightNumber = ResultOfSearchByFlightNumberAssembly().create()
        
        transitionHandler?.pushViewController(resultOfSearchByFlightNumber.1, animated: false)
    }
    
    fileprivate func showTimeTable() {
        let assemblyResult = TimeTableAssembly().create(
            output: OutputScreenContainer<TimeTableOutput>(outputScreen: self),
            serviceLocator: serviceLocator)
    
        transitionHandler?.pushViewController(assemblyResult.view, animated: false)
    }
    
    fileprivate func showFlightInfo() {
        let flightInfo = FlightInformationAssembly().create(output: self)
        
        flightInfo.presenter?.output = self
        transitionHandler?.pushViewController(flightInfo, animated: false)
    }
    
    fileprivate func showPlaneInfo() {
        let planeInfo = PlaneInformationAssembly().create(output: self)
        
        planeInfo.presenter?.output = self
        transitionHandler?.pushViewController(planeInfo, animated: false)
    }
    
    fileprivate func showPlaneOnMap() {
//        let planeOnMap = PlaneOnMapViewAssembly().create(output: self)
//
//        planeOnMap.presenter?.output = self
        let planeOnMap = PlaneOnMapViewController()
        transitionHandler?.pushViewController(planeOnMap, animated: false)
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
