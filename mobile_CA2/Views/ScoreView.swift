//
//  ScoreView.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import SwiftUI
import SwiftData

struct ScoreView: View {
    @Query(sort: \Score.gameScore, order: .reverse) var allScores: [Score]
    
    var body: some View {
        VStack {
            List(allScores) { score in
                HStack {
                    Text("Score \(score.gameScore)")
                    Text("Grade \(score.grade)")
                    Text("Time \(score.gameTime)")
                    Text("\(score.date.formatted(date: .abbreviated, time: .omitted))")
                }
            }
        }
    }
}

#Preview {
}
