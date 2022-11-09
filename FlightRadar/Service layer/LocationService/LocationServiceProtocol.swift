import Foundation

struct Location {
    let longitide: Double
    let latitude: Double
}

protocol LocationServiceProtocol {
    
    var delegate: LocationServiceDelegate? { get set }
    
    func requestCurrentLocation()
}

protocol LocationServiceDelegate: AnyObject {
    
    func didReceiveLocation(
        _ service: LocationServiceProtocol,
        location: Location
    )
}
