//
//  ContentView.swift
//  SwiftUI-MapKit
//
//  Created by Joel Joseph on 1/14/21.
//

import MapKit
import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var loc:LocationManager//Environment Object Passed Through
    @State var tracking:MapUserTrackingMode = .follow//Tracking Mode for more info check Apple Documentation
    @State var location:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.981464, longitude: 23.730098), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    let annotations = [Landmark(title: "Submarine", status: "yusss", coordinate: CLLocationCoordinate2D(latitude: 34.786192, longitude: -125.394292))]
    
    var body: some View {
        Map(coordinateRegion: $location, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: annotations, annotationContent:{(location)in
            
            //Map Annotation here can be changed to MapPin or MapMarker
            MapAnnotation(coordinate: location.coordinate){ CustomViewAnnotation()}
            
        }).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK:- Landmark Data
//Struct to hold annotation Data
struct Landmark:Identifiable{
    let id = UUID()
    let title:String
    let status:String
    let coordinate: CLLocationCoordinate2D
    
    
}

//Creates a view that has a yellow circle
struct CustomViewAnnotation:View{
    var body:some View{
        VStack {
            Button(action:{}) {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 25, height: 25, alignment: .center)
            }
        }
    }
}
