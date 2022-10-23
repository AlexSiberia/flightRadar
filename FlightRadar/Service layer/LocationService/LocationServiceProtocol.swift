import Foundation

struct Location {
    let longitude: Double
    let latitude: Double
}

protocol LocationServiceProtocol {
    
    var delegate: LocationServiceDelegate? { get set }
    
    func requestCurrentLocation()
}

protocol LocationServiceDelegate: AnyObject {
    func didRecieveLocation(
        _ service: LocationServiceProtocol,
        location: Location
    )
}
