//
//  ResultsView.swift
//  mobile_CA2
//
//  Created by Student on 28/03/2025.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    let context: ModelContext
    let viewModel: ResultsViewModel
    
    var body: some View {
        ZStack {
            
            VStack{
                Spacer()
                HStack{
                    Text ("Final Score: ")
                    Text (viewModel.finalPercentText)
                }
                .font(.title)
                .padding()
                HStack{
                    Text ("Grade:")
                    Text (viewModel.letterGradeText)
                        .padding()
                        .font(.title)
                }
                Text("Total time: \(viewModel.totalGameTimeText)")
                Spacer()
                Text(viewModel.CorrectGuesses)
                    .font(.system(size:30))
                Text(viewModel.WrongGuesses)
                    .font(.system(size:30))
                Spacer()
                NavigationLink (
                    destination: Quiz(context: context, question: Question.allQuestions[0]),
                    label: { BottomText(str: NSLocalizedString("Retake Quiz", comment: "Button to restart quiz"))
                    })
                .padding(.vertical)
                
                NavigationLink (
                    destination: ContentView(),
                    label: {
                        BottomText(str: NSLocalizedString("Exit", comment: "Button to exit back to main menu") )
                    })
            }
        }
        .navigationBarHidden(true)
        .task {
            let newScore = Score(
                grade: viewModel.letterGradeText,
                gameScore: viewModel.score,
                gameTime: viewModel.totalGameTimeText,
                date: Date()
            )
            context.insert(newScore)
        }
    }
    
}

#Preview {
    NavigationView{
    }

}
