//
//  ScrollImage.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 19/09/24.
//

import SwiftUI

struct ScrollImage: View {
    let image: Image

    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()

            // MARK: - give clip image border
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.black, lineWidth: 20)
                )
                .clipShape(RoundedRectangle(cornerRadius: 40))

                .scrollTransition { content, phase in
                    content
                        .scaleEffect(phase.isIdentity ? 1 : 0.5)
                        .opacity(phase.isIdentity ? 1 : 0.5)
                }

        }

    }
}

