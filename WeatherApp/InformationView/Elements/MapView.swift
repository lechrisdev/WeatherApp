//
//  MapView.swift
//  WeatherApp
//
//  Created by Le Chris on 22.03.2023.
//

import SwiftUI
import MapKit

struct MapView: View {

    struct CityPin: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var pin: [CityPin] = []
    
    @State var region: MKCoordinateRegion

    init(lat: CLLocationDegrees, long: CLLocationDegrees) {
        let pin = CityPin(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
        self.pin.append(pin)
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat,
                                           longitude: long),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    }
            
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: pin, annotationContent: { MapMarker(coordinate: $0.coordinate)
                
            })
                .clipShape(RoundedRectangle(cornerRadius: 11))
                .frame(height: 230)
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(lat: 46.4774700, long: 30.7326200)
    }
}
