import Foundation

protocol ResultOfSearchByFlightNumberViewOutput: AnyObject {
    
    func didLoadView()
    func userDidSelect(flight: FlightNumberPresentationModel)
    func userDidSelect(airline: AirlinePresentationModel)
}
