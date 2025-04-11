//
//  Game.swift
//  mobile_CA2
//
//  Created by Student on 21/03/2025.
//

import Foundation

struct Game {
    
    private let questions = Question.allQuestions.shuffled()
    
    private(set) var currentQuestionIndex = 0
    
    private(set) var guesses = [Question: Int]()
    
    private var gameIsOver = false
    
    var questionCount: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
        
    }
    
    mutating func advanceGameState() {
        let nextQuestionIndex = currentQuestionIndex + 1
        if !questions.indices.contains(nextQuestionIndex){
            gameIsOver = true
            print("Game Over")
        } else {
            currentQuestionIndex = nextQuestionIndex
        }
        
    }
    
    mutating func makeGuess(at index: Int) {
        guesses[currentQuestion] = index
    }
    
}
