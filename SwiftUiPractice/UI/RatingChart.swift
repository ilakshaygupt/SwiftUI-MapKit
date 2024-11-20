//
//  RatingChart.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 20/09/24.
//

import SwiftUI
import Charts


struct SampleRating {
    let place : String
    let rating : Int
    static let sampleRatings : [SampleRating] = [
        SampleRating(place: "Bellagio", rating: 90),
        SampleRating(place: "Paris", rating: 13),
        SampleRating(place: "Treaasure Island", rating: 56),
        SampleRating(place: "Excalibur", rating: 75),
    ]
}

struct RatingChart: View {
    var body: some View {
        Chart(SampleRating.sampleRatings, id : \.place){ rating in
            SectorMark(angle: .value("Ratings", rating.rating),angularInset: 1)
                .cornerRadius(10)
                .foregroundStyle(by: .value("Place", rating.place))
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    RatingChart()
}
