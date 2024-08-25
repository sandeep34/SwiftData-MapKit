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
            ModuleSection(modules: [Modules(index: 0, name: "Symbols"),
                                    Modules(index: 1, name: "Image"),
                                    Modules(index: 3, name: "Scrolling"),
                                    Modules(index: 4, name: "SwiftData"),
                                    Modules(index: 5, name: "Map Preview")])
        }
    }
}
