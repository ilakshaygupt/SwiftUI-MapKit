//
//  ScrollImageUse.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 19/09/24.
//

import SwiftUI

struct ScrollImageUse: View {
    var places: [Place] = Place.previewPlaces


    var body: some View {
        ScrollView
        {
            VStack {
                ForEach(places, id: \.name) { place in
                    ScrollImage(image: place.image)
                }
            }

        }
    }
}

#Preview {
    ScrollImageUse()
}
