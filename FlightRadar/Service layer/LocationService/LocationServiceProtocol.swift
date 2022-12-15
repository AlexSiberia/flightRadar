import Foundation
import CoreLocation

//struct Location {
//    let longitude: CLLocationDegrees
//    let latitude: CLLocationDegrees
//}

protocol LocationServiceProtocol {
    
    var delegate: LocationServiceDelegate? { get set }
    
    func requestCurrentLocation()
}

protocol LocationServiceDelegate: AnyObject {
    func didRecieveLocation(
        _ service: LocationServiceProtocol,
        location: CLLocationCoordinate2D
    )
}
