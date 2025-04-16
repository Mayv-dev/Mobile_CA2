//
//  UNGoals.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI

struct UNGoals: View {
    @State private var sdgGoals: [SDGGoal] = []
    @State private var selGoal: SDGGoal? = nil
    
    var body: some View {
        VStack {
            if selGoal == nil {
                List(sdgGoals, id: \.code) { goal in
                    Section(header: Text("Goal \(goal.code)").bold()) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(goal.title).font(.headline)
                            Text(goal.description).font(.subheadline).foregroundColor(.gray)
                        }
                    }.onTapGesture(count: 2) {_ in
                        selGoal = goal
                    }
                }
                .navigationTitle("UN Goals")
            } else {
                Section(header: Text("Goal \(selGoal?.code ?? "")").bold()) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(selGoal?.title ?? "").font(.headline)
                        Text(selGoal?.description ?? "").font(.subheadline).foregroundColor(.gray)
                    }
                }.onTapGesture(count: 2) {_ in
                    selGoal = nil
                }
            }
        }.onAppear(){
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
