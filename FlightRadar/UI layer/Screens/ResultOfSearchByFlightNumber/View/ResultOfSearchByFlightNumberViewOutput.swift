import Foundation

protocol ResultOfSearchByFlightNumberViewOutput: AnyObject {
    
    func didLoadView()
    func userDidSelect(flight: FlightNumberModel)
    func userDidSelect(airline: AirlineModel)
}
