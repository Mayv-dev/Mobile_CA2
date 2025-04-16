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
        List(sdgGoals, id: \.code) { goal in
            Section(header: Text("Goal \(goal.code)").bold()) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(goal.title).font(.headline)
                    Text(goal.description).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("UN Goals")
        .onAppear {
            fetchGoals()
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
