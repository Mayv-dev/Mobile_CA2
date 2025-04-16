//
//  ResultsViewModel.swift
//  mobile_CA2
//
//  Created by Student on 28/03/2025.
//

import Foundation

struct ResultsViewModel {
    let selectionCount: (correct: Int, incorrect: Int)
    let gameStartTime: Date
    let gameEndTime: Date

    var finalPercentText: String {
        " \(score)%"
    }

    var letterGradeText: String {
        switch score {
        case 90..<100: return "A"
        case 80..<90: return "B"
        case 70..<80: return "C"
        case 60..<70: return "D"
        case 0..<60: return "F"
        default: return "?"

        }
    }

    var CorrectGuesses: String {
        "\(selectionCount.correct) ✓"
    }

    var WrongGuesses: String {
        "\(selectionCount.incorrect) X"
    }

    var totalGameTimeText: String {
        "\(gameEndTime.timeIntervalSince(gameStartTime)) "
    }

    private var score: Int {
        selectionCount.correct * 100
            / (selectionCount.correct + selectionCount.incorrect)
    }
}
