//
//  PlacelList.swift
//  SwiftUiPractice
//
//  Created by Lakshay Gupta on 20/09/24.
//

import SwiftUI
import SwiftData
import MapKit
struct PlacelList : View {
    @Query(sort: \Place.name)  private var places : [Place]
    @State private var showImage : Bool = false
    @State private var seachText : String = ""
    @State private var filteredByInterested : Bool = false
    @Namespace var namespace


    private var predicate : Predicate<Place>
    {
        #Predicate<Place>{
            if !seachText.isEmpty && filteredByInterested {
                $0.name.localizedStandardContains(seachText)
                && $0.interested

            }
            else if  !seachText.isEmpty {
                $0.name.localizedStandardContains(seachText)

            }
            else if filteredByInterested{
                $0.interested
            }
            else {
                true
            }
        }
    }

    var body: some View {
        NavigationStack{
            List((try? places.filter(predicate)) ?? places){ place in
                NavigationLink(value:place){
                    HStack{
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(width: 100,height: 100)

                        Text(place.name)
                        Spacer()
                        if place.interested {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                    }
                }
                .matchedTransitionSource(id: 1, in: namespace)
                .swipeActions(edge:.leading){
                    Button(place.interested ? "Interested" : "Not Interested",systemImage:"star"){
                        place.interested.toggle()
                    }
                    .tint(place.interested ? .yellow : .blue)
                }
            }
            .searchable(text: $seachText,prompt: "Find a Place")
            .animation(.default,value: seachText)
            .navigationTitle("Places")
            .navigationDestination(for: Place.self){place in
                MapView(place: place, cameraPostion: .camera(MapCamera(
                    centerCoordinate: place.location, distance: 1000, heading: 250, pitch: 80
                )))
                .navigationTransition(.zoom(sourceID:1 , in:namespace))
            }

            .sheet(isPresented : $showImage){
                ScrollImageUse()
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("show Image",systemImage: "photo"){
                        showImage.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Filter Interested",systemImage: !filteredByInterested ? "star" : "star.fill"){
                        withAnimation {
                            filteredByInterested.toggle()
                        }
                    }
                    .tint(filteredByInterested ? .yellow : .blue)
                }
            }

        }
    }
}



#Preview {
    PlacelList()
        .modelContainer(Place.preview)
}
