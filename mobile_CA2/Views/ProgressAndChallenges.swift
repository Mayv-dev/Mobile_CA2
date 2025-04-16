//
//  Progress&Challenges.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI

struct Progress_Challenges: View {
    @State private var causes: [Cause] = []

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
                .navigationTitle("Progress")
            }
        }
    }

    private func loadCauses() {
        if let causesData: [Cause] = loadJSON("Progress", as: [Cause].self) {
            causes = causesData
        } else {
            print("🚨 Failed to load data.")
        }
    }
}

#Preview {
    Progress_Challenges()
}
