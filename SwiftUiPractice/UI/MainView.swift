//
//  MainView.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 20/09/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        TabView{
            Tab("Places",systemImage: "photo"){
                PlacelList()
            }
            Tab("Trip History",systemImage: "chart.line.uptrend.xyaxis"){
                TripsChart()
            }

        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
        .modelContainer(Place.preview)
}
