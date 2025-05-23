//
//  GameViewModel.swift
//  mobile_CA2
//
//  Created by Student on 21/03/2025.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var game = Game()

    var questionText: String {
        game.currentQuestion.questionText
    }

    var answerIndices: Range<Int> {
        game.currentQuestion.possibleAnswers
            .indices
    }

    var correctAnswerIndex: Int {
        game.currentQuestion.correctAnswerIndex
    }

    var progressText: String {
        String(
            format: NSLocalizedString(
                "Question %d / %d", comment: "Current Question"),
            game.currentQuestionIndex + 1, game.questionCount)
    }

    var guessWasMade: Bool {
        game.guesses[game.currentQuestion] != nil
    }

    var selectionCount: (Int, Int) {
        game.selectionCount
    }

    var gameIsOver: Bool {
        game.gameIsOver
    }

    var gameStartTime: Date {
        game.startTime
    }

    func answerText(for index: Int) -> String {
        game.currentQuestion.possibleAnswers[index]
    }

    func advanceGameState() {
        game.advanceGameState()
    }

    func makeGuessForCurrentQuestion(at index: Int) {
        game.makeGuess(at: index)
    }

    func colorForButton(at buttonIndex: Int) -> Color {
        guard let guessedIndex = game.guesses[game.currentQuestion],
            guessedIndex == buttonIndex
        else { return .white }
        if guessedIndex == correctAnswerIndex {
            return .green
        } else {
            return .red
        }
    }
}
