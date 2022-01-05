//
//  mapView.swift
//  Bucketlist
//
//  Created by Luthfor Khan on 1/4/22.
//

import MapKit
import SwiftUI

struct LocationType: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct mapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        LocationType(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        LocationType(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationView{
            //        Map(coordinateRegion: $mapRegion)
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                //            MapMarker(coordinate: location.coordinate)
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
//                        .onTapGesture {
//                            print("Tapped on \(location.name)")
//                        }
                    }
                }
            }
            .navigationTitle("London Explorer")
        }
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}
