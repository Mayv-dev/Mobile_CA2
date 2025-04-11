//
//  MapView.swift
//  mobile_CA2
//
//  Created by Student on 11/04/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var country: String? = nil
    
    let manager = CLLocationManager()
    var body: some View {
        Map() {
            UserAnnotation()
        }
        .onAppear(){
            manager.requestWhenInUseAuthorization()
            
        }
        VStack {
            if let country = country {
                Text("Your in:")
            }
        }
    }
}

#Preview {
    MapView()
}
