//
//  Quiz.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

// Video refrence for the quiz
// https://www.youtube.com/live/mFT21IzGW1w?feature=shared
// https://www.youtube.com/live/r1C8HK5_hsc?feature=shared
// 

import SwiftUI
import SwiftData

struct Quiz: View {
    @StateObject var viewModel = GameViewModel()
    
    let context: ModelContext
    let question: Question
    var body: some View {
        ZStack {
            VStack {
                Text("Quiz")
                    .font(.largeTitle)
                Text(viewModel.progressText)
                    .padding()
                Spacer()
                Text(viewModel.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Spacer()
                Spacer()
                HStack {
                    ForEach(viewModel.answerIndices) {index in
                        AnswerButton(text: viewModel.answerText(for: index)){
                            viewModel.makeGuessForCurrentQuestion(at: index)
                        }
                        .background(viewModel.colorForButton(at: index))
                        .disabled(viewModel.guessWasMade)
                    }
                }
                if viewModel.guessWasMade {
                    Button(action: {
                        viewModel.advanceGameState()
                    }) {
                        
                        Text("Next")
                    }
                    .padding()
                    .border(Color.black, width: 4)
                }
            }.padding(.bottom)
        }
        .navigationBarHidden(true)
        .background(resultsNavigationView)
    }
    private var resultsNavigationView: some View {
        NavigationLink(destination: ResultsView(context: context, viewModel: ResultsViewModel(selectionCount: viewModel.selectionCount , gameStartTime: viewModel.gameStartTime, gameEndTime: Date())),isActive: .constant(viewModel.gameIsOver), label: {EmptyView()})
  
        
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
}
