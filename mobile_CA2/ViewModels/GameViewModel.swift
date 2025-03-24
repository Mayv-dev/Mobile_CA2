//
//  GameViewModel.swift
//  mobile_CA2
//
//  Created by Student on 21/03/2025.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var game = Game()
    
    var questionText: String{
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
        "Question \(game.currentQuestionIndex + 1) / \(game.questionCount)"
    }
    
    var guessWasMade: Bool {
        game.guesses[game.currentQuestion] != nil
    }
    
    func answerText(for index: Int) -> String {
        game.currentQuestion.possibleAnswers[index]
    }
    
    func advanceGameState() {
        game.advanceGameState()
    }
    
    func  makeGuessForCurrentQuestion(at index: Int)
    {
        game.makeGuess(at: index)
    }
    
    func colorForButton(at buttonIndex: Int) -> Color {
      guard let guessedIndex = game.guesses[game.currentQuestion], guessedIndex == buttonIndex else { return .white}
        if guessedIndex == correctAnswerIndex {
            return .green
        } else {
            return .red
        }
    }
}
    
