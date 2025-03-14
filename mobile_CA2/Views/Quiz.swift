//
//  Quiz.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI

struct Quiz: View {
    let question: Question
    
   @State var guessedIndex: Int? = nil

    var body: some View {
     ZStack {
        VStack {
            Text("Quiz")
                .font(.largeTitle)
            Text("Question 1 / 4")
                .padding()
        Spacer()
            Text(question.questionText)
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(.all)
        Spacer()
        Spacer()
        HStack {
            ForEach(0..<question.possibleAnswers.count, id: \.self) { index in
            AnswerButton(text: question.possibleAnswers[index])
            {
                guessedIndex = index
                print("Button \(index) tapped")
            }
            .background(colorForButton(at: index))
            .disabled(guessedIndex != nil)
                    }
                 }
                 if guessedIndex != nil {
                 BottomText(str: "Next")
                 }
            }
        }
     }
    
    func colorForButton(at buttonIndex: Int) -> Color {
      guard let guessedIndex = guessedIndex, guessedIndex == buttonIndex else { return .white}
        if guessedIndex == question.correctAnswerIndex {
            return .green
        } else {
            return .red
        }
    }

}
   

struct AnswerButton: View{
    let text: String
    let onClick: () -> Void
    var body: some View{
        Button(action: {
            onClick()
        }) {
            
            Text(text)
        }
        .padding()
        .border(Color.black, width: 4)
    }
}

#Preview {
    Quiz(question: Question.allQuestions[0])
}
