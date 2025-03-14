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
        Question(questionText: "What is UN's goal for ending poverty?",
                 possibleAnswers: [   "Reduce it by 50%",
                                      "Eliminate it completely",
                                      "Reduce it by 25%",
                                      "Keep it the same",
                                      ],
                 correctAnswerIndex: 1),
        
        Question(questionText: "What daily income defines extreme poverty?",
                 possibleAnswers: [   "$2.50",
                                      "$3.50",
                                      "$1.90",
                                      "$5.00",
                                      ],
                 correctAnswerIndex: 2),

                      
        Question(questionText: "What region has the highest poverty rate?",
                 possibleAnswers: [   "Europe",
                                      "South America",
                                      "Sub-Saharan Africa",
                                      "Asia",
                                      ],
                 correctAnswerIndex: 2),

                      
        Question(questionText: "What is a key strategy for ending poverty?",
                 possibleAnswers: [   "Improving education",
                                      "Increasing tax",
                                      "Increasing employment",
                                      "Improving healthcare",
                                      ],
                 correctAnswerIndex: 0),
    ]
}
