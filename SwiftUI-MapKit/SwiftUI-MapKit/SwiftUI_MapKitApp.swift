//
//  SwiftUI_MapKitApp.swift
//  SwiftUI-MapKit
//
//  Created by Joel Joseph on 1/14/21.
//

import SwiftUI
import CoreLocation

class LocationManager:ObservableObject{
    
    //Location Manager. Requests user for Location Data
    @Published var locationManager = CLLocationManager()
    
    init(){ }
    
    func getLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

@main
struct SwiftUI_MapKitApp: App {
    let loc = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(loc).onAppear(perform: {
                loc.getLocation()
            })
        }
    }
}
