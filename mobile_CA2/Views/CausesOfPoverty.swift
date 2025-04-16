//
//  CausesOfPoverty.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI
struct CausesOfPoverty: View {
    @State private var causes: [Cause] = []

    var body: some View {
        List(causes, id: \.id) { cause in
            VStack(alignment: .leading) {
                Text(cause.title)
                    .font(.headline)
                Text(cause.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
        }
        .onAppear {
            loadCauses()
        }
        .navigationTitle("Causes of Poverty")
    }

    private func loadCauses() {
        if let causesData: [Cause] = loadJSON("PovertyCauses", as: [Cause].self) {
            causes = causesData
        } else {
            print("🚨 Failed to load data.")
        }
    }
}

#Preview {
    CausesOfPoverty()
}
