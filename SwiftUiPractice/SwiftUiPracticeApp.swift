//
//  SwiftUiPracticeApp.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 19/09/24.
//

import SwiftUI

@main
struct SwiftUiPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            PlacelList()
                .modelContainer(Place.preview)
        }
    }
}
