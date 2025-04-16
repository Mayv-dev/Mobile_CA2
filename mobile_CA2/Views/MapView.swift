import MapKit
//
//  MapView.swift
//  mobile_CA2
//
//  Created by Student on 11/04/2025.
//
import SwiftUI

struct MapView: View {
    @State private var country: String? = nil
    let manager = CLLocationManager()

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    Color(red: 236 / 255.0, green: 28 / 255.0, blue: 45 / 255.0)
                )
                .ignoresSafeArea()

            VStack {

                Text("Unicef Poverty")
                    .bold()
                    .font(.title)
                    .colorInvert()

                VStack {
                    Map {
                        UserAnnotation()
                    }
                    .onAppear {
                        manager.requestWhenInUseAuthorization()
                    }

                    if let country = country {
                        Text("You're in: \(country)")
                            .font(.title2)
                            .padding()
                    }
                }
                .navigationTitle("Country Comparison")
            }
        }
    }
}

#Preview {
    NavigationStack {
        MapView()
    }
}
