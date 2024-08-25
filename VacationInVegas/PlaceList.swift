//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Sandeep.Tomar on 8/22/24.
//

import SwiftUI
import SwiftData
import MapKit

struct PlaceList: View {
    
    @StateObject var viewModel: PlaceViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredPlaces) { place in
                NavigationLink(destination: DetailView(place: place)) {
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        Text(place.name)
                        Spacer()
                        Image(systemName: place.intersted ? "star.fill" : "star")
                                .foregroundStyle(.yellow)
                    }
                }
            }
            .navigationTitle("Places")
//            .navigationDestination(for: Place.self) { place in
//                MapViewScreen(place: place, position: .camera(MapCamera(
//                    centerCoordinate: place.location, distance: 1000, heading: 250, pitch: 80
//                )))
//            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show Images", systemImage: "photo") {
                        viewModel.toggleShowImages()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Filter", systemImage: viewModel.showInterestedOnly ? "star.fill" : "star") {
                        withAnimation {
                            viewModel.toggleFilter()
                        }
                        
                    }
                    .tint(viewModel.showInterestedOnly ? .yellow : .blue)
                }
            }
            .searchable(text: $viewModel.searchText, prompt: "Fine a place")
            .animation(.default, value: viewModel.searchText)
            .sheet(isPresented: $viewModel.showImages) {
                Scrolling()
            }
        }
    }
    
}

//#Preview {
//    PlaceList()
//}


