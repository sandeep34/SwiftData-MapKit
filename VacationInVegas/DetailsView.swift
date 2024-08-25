//
//  DetailsView.swift
//  VacationInVegas
//
//  Created by Ruchin Somal on 25/08/24.
//

import SwiftUI

struct DetailView: View {
    let place: Place
    
    var body: some View {
        VStack {
            place.image
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            Text(place.name)
                .font(.largeTitle)
                .padding()
            Text("Latitude: \(place.latitude)")
            Text("Longitude: \(place.longitude)")
            Toggle("Interested", isOn: .constant(place.intersted))
        }
        .navigationTitle(place.name)
        .padding()
    }
}
