//
//  AirportModel.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.12.2022.
//

import Foundation
import MapKit

class AirportModel: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
