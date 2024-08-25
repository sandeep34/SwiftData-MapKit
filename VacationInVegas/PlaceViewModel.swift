//
//  PlaceViewModel.swift
//  VacationInVegas
//
//  Created by Ruchin Somal on 25/08/24.
//

import Foundation
import SwiftUI

class PlaceViewModel: ObservableObject {
    @Published var places: [Place]
    @Published var showInterestedOnly: Bool = false
    @Published var showImages: Bool = false
    @Published var searchText: String = ""
    
    init(places: [Place]) {
        self.places = places
    }
    
    var filteredPlaces: [Place] {
        let filteredByInterest = showInterestedOnly ? places.filter { $0.intersted } : places
        return filteredByInterest.filter { place in
            searchText.isEmpty || place.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    func toggleFilter() {
        showInterestedOnly.toggle()
    }
    
    func toggleShowImages() {
        showImages.toggle()
    }
}
