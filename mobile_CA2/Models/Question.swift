//
//  Question.swift
//  mobile_CA2
//
//  Created by Student on 14/03/2025.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(questionText: "What year does the UN aim to end poverty ?",
                 possibleAnswers: [   "2090",
                                      "2030",
                                      "2065",
                                      "2040",
                                      ],
                 correctAnswerIndex: 1),
        
        Question(questionText: "Wahat is considered the international poverty line (living on less than)?",
                 possibleAnswers: [   "$2.50",
                                      "$2.15",
                                      "$1.90",
                                      "$3.50",
                                      ],
                 correctAnswerIndex: 1),

                      
        Question(questionText: "What region has the highest poverty rate?",
                 possibleAnswers: [   "Europe",
                                      "America",
                                      "Africa",
                                      "Asia",
                                      ],
                 correctAnswerIndex: 2),
        
        Question(questionText: "What is the Goal",
                 possibleAnswers: [   "Reduce poverty",
                                      "No Change",
                                      "Some poverty",
                                      "No poverty",
                                      ],
                 correctAnswerIndex: 3),

                      
        Question(questionText: "How many million people live in extreme poverty?",
                 possibleAnswers: [   "700mil",
                                      "200mil",
                                      "900mil",
                                      "400mil",
                                      ],
                 correctAnswerIndex: 0),
    ]
}
