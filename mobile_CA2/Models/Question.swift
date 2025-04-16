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
        Question(
            questionText: NSLocalizedString(
                "What year does the UN aim to end poverty ?",
                comment: "Question 1"),
            possibleAnswers: [
                NSLocalizedString("2090", comment: "Option A"),
                NSLocalizedString("2030", comment: "Option B - Correct"),
                NSLocalizedString("2065", comment: "Option C"),
                NSLocalizedString("2040", comment: "Option D"),
            ],
            correctAnswerIndex: 1),

        Question(
            questionText: NSLocalizedString(
                "What is considered the international poverty line (living on less than)?",
                comment: "Question 2"),
            possibleAnswers: [
                NSLocalizedString("$2.50", comment: "Option A"),
                NSLocalizedString("$2.15", comment: "Option B - Correct"),
                NSLocalizedString("$1.90", comment: "Option C"),
                NSLocalizedString("$3.50", comment: "Option D"),
            ],
            correctAnswerIndex: 1),

        Question(
            questionText: NSLocalizedString(
                "What region has the highest poverty rate?",
                comment: "Question 3"),
            possibleAnswers: [
                NSLocalizedString("Europe", comment: "Option A"),
                NSLocalizedString("South America", comment: "Option B"),
                NSLocalizedString("Africa", comment: "Option C - Correct"),
                NSLocalizedString("Asia", comment: "Option D"),
            ],
            correctAnswerIndex: 2),

        Question(
            questionText: NSLocalizedString(
                "What is the Goal", comment: "Question 4"),
            possibleAnswers: [
                NSLocalizedString("Reduce poverty", comment: "Option A"),
                NSLocalizedString("No Change", comment: "Option B"),
                NSLocalizedString("Some poverty", comment: "Option C"),
                NSLocalizedString("No poverty", comment: "Option D - Correct"),
            ],
            correctAnswerIndex: 3),

        Question(
            questionText: NSLocalizedString(
                "How many million people live in extreme poverty?",
                comment: "Question 5"),
            possibleAnswers: [
                NSLocalizedString("700mil", comment: "Option A - Correct"),
                NSLocalizedString("200mil", comment: "Option B"),
                NSLocalizedString("900mil", comment: "Option C"),
                NSLocalizedString("400mil", comment: "Option D"),
            ],
            correctAnswerIndex: 0),
    ]
}
