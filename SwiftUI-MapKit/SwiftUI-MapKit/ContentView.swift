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
    @EnvironmentObject var loc:LocationManager
    @State var tracking:MapUserTrackingMode = .follow
    @State var location:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.981464, longitude: 23.730098), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        Map(coordinateRegion: $location, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
