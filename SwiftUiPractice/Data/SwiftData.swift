//
//  SwiftData.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 19/09/24.
//

import SwiftData
import SwiftUI
import MapKit

@Model
class Place {
    #Unique<Place>([\.name,\.longitude,\.latitude])

    @Attribute(.unique) var name : String
    var longitude : Double
    var latitude : Double
    var interested : Bool
    var image : Image {
        Image(self.name.lowercased().replacingOccurrences(of: " ", with: ""))
    }

    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }


    init(name: String, longitude: Double, latitude: Double, interested: Bool) {
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.interested = interested
    }

    @MainActor
    static var preview : ModelContainer {
        let container =  try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        return container
    }

    static var previewPlaces : [Place] {
        [
            Place(name: "Bellagio", longitude: 2.2945, latitude: 48.8584, interested: true),
            Place(name: "Paris", longitude: -74.0445, latitude: 40.6892, interested: false),
            Place(name: "Treasure Island", longitude: 78.0421, latitude: 27.1751, interested: true),
            Place(name: "Stratosphere", longitude: 096.5704, latitude: 40.4319, interested: false),
            Place(name: "Luxor", longitude: -72.5450, latitude: -13.1631, interested: true),
            Place(name: "Excalibur", longitude: 12.4924, latitude: 41.8902, interested: false)
        ]

    }
}
