import Foundation
import CoreLocation

final class LocationService: NSObject, LocationServiceProtocol {
    
    weak var delegate: LocationServiceDelegate? = nil
    private let locationManager: CLLocationManager
    
    init(locationManager: CLLocationManager =  CLLocationManager()) {
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }
    
    private func retrieveLocation() {
        let status = locationManager.authorizationStatus
        
        if status == .denied || status == .restricted {
            return
        }
        
        if !CLLocationManager.locationServicesEnabled() {
            return
        }
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
            
            return
        }
        
        locationManager.requestLocation()
    }
    
    // MARK: - LocationServiceProtocol
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestCurrentLocation() {
        retrieveLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied, .restricted:
            print("Определение геолокации невозможно")
        case .notDetermined:
            print("Определение геолокации не запрошено")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let userLocation = Location(
                longitide: location.coordinate.latitude,
                latitude: location.coordinate.longitude
            )
            
            delegate?.didReceiveLocation(self, location: userLocation)
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Handle failure to get a user’s location
    }
}
