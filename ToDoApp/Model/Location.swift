//
//  Location.swift
//  ToDoApp
//
//  Created by Daniil Belyaev on 22.06.2021.
//

import Foundation
import CoreLocation

struct Location: Equatable {

    
    var name: String
    var coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude && lhs.coordinate?.longitude == rhs.coordinate?.longitude &&
                lhs.name == rhs.name else {return false}
        return true
    }
}
