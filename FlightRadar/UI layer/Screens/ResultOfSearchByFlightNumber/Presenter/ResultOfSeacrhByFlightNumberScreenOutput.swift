import Foundation

protocol ResultOfSeacrhByFlightNumberScreenOutput: AnyObject {
    
    func didSelect(flight: FlightNumberPresentationModel)
    func didSelect(airline: String)
}
