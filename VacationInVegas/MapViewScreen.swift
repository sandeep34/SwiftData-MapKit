//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

struct MapViewScreen: View {
    
    var place: Place
    
    @State var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position) {
            Annotation(place.intersted ? "Place of Interest" : "Not Interested", coordinate: place.location) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThickMaterial)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: place.intersted ? "face.smiling" : "hand.thumbsdown")
                        .padding()
                }
                .onTapGesture {
                    place.intersted.toggle()
                }
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    
    @Previewable @State var place = Place.previewPlaces[1]
    
    MapViewScreen(place: place, position: .camera(MapCamera(
    
        centerCoordinate: place.location, distance: 1000, heading: 250, pitch: 80
        
    )))
}
