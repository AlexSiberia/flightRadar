import Foundation

// VIPER = View + Interactor + Presenter + Entity + Router

struct FlightPresentationbModel {
    let number: String
    let continuity: Double
}

struct FlightsListState {
    let models: [FlightPresentationbModel]
    let avatar: Data
    let title: String
}

class FlightsListPresenter: FlightsListPresenterProtocol {
    
    weak var view: FlightsListViewController? = nil
    var state: FlightsListState
    
    let flightsService: FlightService
    
    func didLoadView() {
        //    flightsService.getData() -> Data1
        //    airportService.getData() -> Data2
        //    data1 -> FlightPresentationbModel
        //    data2 -> FlightPresentationbModel
        //    [FlightPresentationbModel]
        //    view.update([FlightPresentationbModel]) | view.show(error: Error)
    }
    
}


class FlightsListViewModel {
    
    weak var view: FlightsListViewProtocol? = nil
    var state: FlightsListState {
        didSet {
            view.update(newValue)
        }
    }
    
    let flightsService: FlightService
    
    func didLoadView() {
        //    flightsService.getData() -> Data1
        //    flightsService.getData() -> Data2
        //    data1 -> FlightPresentationbModel
        //    data2 -> FlightPresentationbModel
        //    self.state = [FlightPresentationbModel]
    }
    
}
