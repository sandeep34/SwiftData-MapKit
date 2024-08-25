//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import MapKit

struct MapViewScreen: View {
    
    private let place: Place
    @State var position: MapCameraPosition
    
    init(place: Place, position: MapCameraPosition) {
        self.place = place
        self.position = position
    }
    
    var body: some View {
        NavigationStack {
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
        }
        .toolbarBackground(.automatic)
    }
}
