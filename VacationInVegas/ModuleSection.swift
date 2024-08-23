//
//  ModuleSection.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

struct ModuleSection: View {
    
    let modules = Modules.preview()
    @State var position: MapCameraPosition
    
    var body: some View {
        
        NavigationStack {
            
            Section {
                List(modules, id: \.id) { item in
                    switch item.id {
                    case 0:
                        NavigationLink(destination: Symbols()) {
                            HStack {
                                Text(item.name)
                                Spacer()
                            }
                        }
                    case 1:
                        NavigationLink(destination: ScrollImage(image: "bellagio")) {
                            HStack {
                                Text(item.name)
                                Spacer()
                            }
                        }
                    case 3:
                        NavigationLink(destination: Scrolling()) {
                            HStack {
                                Text(item.name)
                                Spacer()
                            }
                        }
                    case 4:
                        NavigationLink(destination: PlaceList()) {
                            HStack {
                                Text(item.name)
                                Spacer()
                            }
                        }
                    case 5:
                        
                        NavigationLink(destination: MapViewScreen(place: Place.previewPlaces[0], position: position)) {
                            HStack {
                                Text(item.name)
                                Spacer()
                            }
                        }
                        
                    default:
//                        NavigationLink(destination: Scrolling()) {
//                            HStack {
//                                Text(item.name)
//                                Spacer()
//                            }
//                        }
                        Text("Default case")
                    }
                    
                }
                .navigationTitle("Select Module you like to explore")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            Section {
                NavigationLink(destination: PlaceList()) {
                    Button("Show Place List") {
                        PlaceList()
                    }
                }
               
            }
                
        }
    }
}

struct Modules {
    var id: Int
    var name: String
    
    
    static func preview() -> [Modules] {
        return [Modules(id: 0, name: "Symbols"),
                Modules(id: 1, name: "Image"),
                Modules(id: 3, name: "Scrolling"),
                Modules(id: 4, name: "SwiftData"),
                Modules(id: 5, name: "Map Preview"),
                Modules(id: 6, name: "None"),
                Modules(id: 12, name: "None")]
    }
}

#Preview {
    ModuleSection(position: .camera(MapCamera(
        
        centerCoordinate: Place.previewPlaces[0].location, distance: 1000, heading: 250, pitch: 80
        
    )))
}
