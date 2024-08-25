//
//  Place.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftData
import SwiftUI
import MapKit

class Place: Identifiable, Hashable {
    
    let id: UUID = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var intersted: Bool
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image: Image {
        Image(name.lowercased().replacingOccurrences(of: " ", with: ""))
    }
    
    init(name: String, latitude: Double, longitude: Double, intersted: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.intersted = intersted
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(latitude)
            hasher.combine(longitude)
        }
}
