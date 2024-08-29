//
//  ModuleSection.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

struct ModuleSection: View {
    @State private var selectedModule: Modules?
    
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
            List(modules) { module in
                NavigationLink(
                    value: module,
                    label: {
                        Text(module.name)
                    }
                )
            }
            .navigationTitle("Select Module you like to explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Modules.self) { module in
                detailView(for: module)
            }
        }
    }
    
    @ViewBuilder
    private func detailView(for module: Modules) -> some View {
        switch module.index {
        case 0:
            Symbols()
        case 1:
            ScrollImage(image: "bellagio")
        case 3:
            Scrolling()
        case 4:
            PlaceList(viewModel: PlaceViewModel(places: places))
        case 5:
            MapViewScreen(
                place: places[0],
                position: MapCameraPosition.camera(MapCamera(centerCoordinate: places[0].location, distance: 1000, heading: 250, pitch: 80))
            )
        case 6:
            PaymentConfirmationView()
        default:
            EmptyView()
        }
    }
}

struct Modules: Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    let index: Int
    let name: String
    
    static func == (lhs: Modules, rhs: Modules) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(index)
        }
}
