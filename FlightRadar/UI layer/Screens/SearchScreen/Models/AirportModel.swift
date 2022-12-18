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

//final class LocationAnnotationView: MKAnnotationView {
//    
//    // MARK: Initialization
//    
//    override init(annotation: MKAnnotation?, reuseIdentifier reuseIndetifier: String?) {
//        super.init(annotation: annotation, reuseIdentifier: reuseIndetifier)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: Setup
//    
//    private func setupUI() {
//        backgroundColor = .clear
//        
//        let view = MapPinView()
//        
//    }
//}
