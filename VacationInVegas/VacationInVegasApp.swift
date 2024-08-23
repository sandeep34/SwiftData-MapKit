//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ModuleSection(position: .camera(MapCamera(
                
                centerCoordinate: Place.previewPlaces[0].location, distance: 1000, heading: 250, pitch: 80
                
            )))
        }
        .modelContainer(for: Place.self)
    }
}
