//
//  ModuleSection.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

struct ModuleSection: View {
    
    let modules: [Modules]
    let places: [Place]
    init(modules: [Modules]) {
        self.modules = modules
        self.places = [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, intersted: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1707, intersted: true),
            Place(name: "Treasure Island", latitude: 36.1247, longitude: -115.1721, intersted: false),
            Place(name: "Stratosphere", latitude: 36.1475, longitude: -115.1566, intersted: true),
            Place(name: "luxor", latitude: 36.0955, longitude: -115.1761, intersted: false),
            Place(name: "excalibur", latitude: 36.0988, longitude: -115.1754, intersted: true)
        
        ]
    }
    
    var body: some View {
        NavigationStack {
                List(modules) { item in
                    switch item.index {
                    case 0:
                        NavigationLink("Symbols", destination: Symbols())
                    case 1:
                        NavigationLink("Image", destination: ScrollImage(image: "bellagio"))
                    case 3:
                        NavigationLink("Scrolling", destination: Scrolling())
                    case 4:
                        NavigationLink("SwiftData", destination: PlaceList(viewModel: PlaceViewModel(places: places)))
                    case 5:
                        NavigationLink("Map Preview", destination: MapViewScreen(
                            place: places[0],
                            position: MapCameraPosition.camera(MapCamera(centerCoordinate: places[0].location, distance: 1000, heading: 250, pitch: 80))
                        ))
                    default:
                        Text("Default case")
                    }
                }
                .navigationTitle("Select Module you like to explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Modules: Identifiable {
    let id: UUID = UUID()
    let index: Int
    let name: String
}
