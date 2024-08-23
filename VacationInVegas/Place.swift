//
//  Place.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftData
import SwiftUI
import MapKit


@Model
class Place {
    
    #Unique<Place>([\.name, \.latitude, \.longitude])
    
    @Attribute(.unique) var name: String
    var latitude: Double
    var longitude: Double
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
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        return container
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, intersted: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1707, intersted: true),
            Place(name: "Treasure Island", latitude: 36.1247, longitude: -115.1721, intersted: false),
            Place(name: "Stratosphere", latitude: 36.1475, longitude: -115.1566, intersted: true),
            Place(name: "luxor", latitude: 36.0955, longitude: -115.1761, intersted: false),
            Place(name: "excalibur", latitude: 36.0988, longitude: -115.1754, intersted: true)
        
        ]
    }
}
