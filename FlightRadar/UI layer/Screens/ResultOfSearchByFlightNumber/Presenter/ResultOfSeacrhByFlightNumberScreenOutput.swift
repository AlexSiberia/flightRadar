import Foundation

protocol ResultOfSeacrhByFlightNumberScreenOutput: AnyObject {
    
    func didSelect(flight: FlightNumberModel)
    func didSelect(airline: AirlineModel)
}
