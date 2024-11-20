//
//  MapView.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 20/09/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var place : Place

    @State var cameraPostion : MapCameraPosition
    var body: some View {
        Map( position : $cameraPostion ){
            Annotation(place.interested ? "Place of interest  " : "Not Interested" ,
                       coordinate: place.location
            ){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThickMaterial)
                        .stroke(.secondary, lineWidth : 5)
                    if place.interested{
                        Image( systemName:  "face.smiling")
                    }
                    else{
                        Image( systemName:  "face.upset")
                    }




                }
                .frame(width: 20,height: 20)
                .onTapGesture {
                    place.interested.toggle()
                }
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {

    @Previewable @State var place  = Place.previewPlaces[0]
    MapView(place: place, cameraPostion: .camera(MapCamera(
        centerCoordinate: place.location, distance: 1000, heading: 250, pitch: 80
    )))
}
