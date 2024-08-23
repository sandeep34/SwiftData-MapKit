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
    
    @Query(sort: \Place.name) private var places: [Place]
    @State private var showImages = false
    @State private var placeArr = [Place]()
    @State private var searchText = ""
    @State private var filterByInterested = false

    @Namespace var nameSpace
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchText.isEmpty && filterByInterested {
                $0.name.localizedStandardContains(searchText) && $0.intersted
            } else if !searchText.isEmpty {
                $0.name.localizedStandardContains(searchText)
            } else if filterByInterested {
                $0.intersted
            } else {
                true
            }
        }
    }
    
    var placeList: [Place] {
        return Place.previewPlaces
    }
    
    var body: some View {
       
        NavigationStack {
            List((try? placeList.filter(predicate)) ?? places) { place in
                
                NavigationLink(value: place) {
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        Text(place.name)
                        
                        Spacer()
                        
                        if place.intersted {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding(.trailing)
                        }
                    }
                }
//                .matchedTransitionSource(id: 1, in: nameSpace)
//                .swipeActions(edge: .leading) {
//                    Button(place.intersted ? "Interested" : "Not Interested", sytemImage: "star") {
//                        place.intersted.toogle()
//                    }
//                    .tint(place.intersted ? .yellow : .gray)
//                }
//                
            }
            .navigationTitle("Places")
            .searchable(text: $searchText, prompt: "Fine a place")
            .animation(.default, value: searchText)
            .navigationDestination(for: Place.self) { place in
                MapViewScreen(place: place, position: .camera(MapCamera(
                    centerCoordinate: place.location, distance: 1000, heading: 250, pitch: 80
                    
                )))
                .navigationTransition(.zoom(sourceID: 1, in: nameSpace))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show Images", systemImage: "photo") {
                        showImages.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Filter", systemImage: filterByInterested ? "star.fill" : "star") {
                        withAnimation {
                            filterByInterested.toggle()
                        }
                        
                    }
                    .tint(filterByInterested ? .yellow : .blue)
                }
            }
            .sheet(isPresented: $showImages) {
                Scrolling()
            }
        }
    }
    
}

#Preview {
    PlaceList().modelContainer(Place.preview)
}
