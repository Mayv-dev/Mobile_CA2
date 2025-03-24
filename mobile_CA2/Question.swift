//
//  Question.swift
//  mobile_CA2
//
//  Created by Student on 14/03/2025.
//

import Foundation

struct Question {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(questionText: "What is the poorest country",
                 possibleAnswers: [   "Egypt",
                                      "Sudan",
                                      "Nigeria",
                                      "Ohio",
                                      ],
                 correctAnswerIndex: 1),
        
        Question(questionText: "Average Wage",
                 possibleAnswers: [   "$2",
                                      "$3",
                                      "$4",
                                      "$5",
                                      ],
                 correctAnswerIndex: 0),
    ]
}
