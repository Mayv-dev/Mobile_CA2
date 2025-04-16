//
//  UNGoals.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI

struct UNGoals: View {
    @State private var sdgGoals: [SDGGoal] = []

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

                List(sdgGoals, id: \.code) { goal in
                    Section(header: Text("Goal \(goal.code)").bold()) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(goal.title).font(.headline)
                            Text(goal.description).font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("UN Goals")
                .onAppear {
                    fetchGoals()
                }
            }
        }
    }

    func fetchGoals() {
        APIManager.shared.fetchSDGGoals { goals in
            if let goals = goals {
                DispatchQueue.main.async {
                    self.sdgGoals = goals
                }
            }
        }
    }
}


#Preview {
    UNGoals()
}
