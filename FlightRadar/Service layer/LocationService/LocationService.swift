import Foundation
import CoreLocation

final class LocationService: NSObject, LocationServiceProtocol {
    
    weak var  delegate: LocationServiceDelegate? = nil
    private lazy var locationManager: CLLocationManager = { [unowned self] in
        let locationManager: CLLocationManager = CLLocationManager()
        locationManager.delegate = self
        
        return locationManager
    }()
    
//    init(locationManager: CLLocationManager = CLLocationManager()) {
//        self.locationManager = locationManager
//        super.init()
//        self.locationManager.delegate = self
//    }
    
    private func retrieveLocation() {
        let status = locationManager.authorizationStatus
        
        if status == .denied || status == .restricted {
            return
        }
        
//        if !CLLocationManager.locationServicesEnabled() {
//            return
//        }
        
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        locationManager.requestLocation()
    }
    
    //MARK: - LocationServiceProtocol
    
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
        case.denied, .restricted:
            print("Определение локации невозможно")
        case .notDetermined:
            print("Определение локации не запрошено")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
        
            let userLocation = Location(
                longitude: longitude,
                latitude: latitude)
            
            delegate?.didRecieveLocation(self, location: userLocation)
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Handle failure to get a user’s location
    }
}
