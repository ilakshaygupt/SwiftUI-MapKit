//
//  TripsChart.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 20/09/24.
//

import SwiftUI
import Charts

struct SampleTripRating {
    let trip : Int
    let rating : Int
    static let sampleRatings : [SampleTripRating] = [
        SampleTripRating(trip: 1, rating: 55),
        SampleTripRating(trip: 2, rating: 12),
        SampleTripRating(trip: 3, rating: 97),
        SampleTripRating(trip: 4, rating: 75),

    ]
}

struct TripsChart: View {
    var body: some View {
        Chart(SampleTripRating.sampleRatings, id : \.trip){ rating in
            BarMark(x: .value("Year", rating.trip), y: .value("Ratign", rating.rating))
            LinePlot(x: "Years",y:"Ratings"){ x in
                return x * 6 + 50

            }

            .foregroundStyle(.purple)

        }
        .chartXScale(domain: 1...5)
        .chartYScale(domain: 1...100)
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    TripsChart()
}
