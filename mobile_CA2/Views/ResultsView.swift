//
//  ResultsView.swift
//  mobile_CA2
//
//  Created by Student on 28/03/2025.
//

import SwiftUI

struct ResultsView: View {
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
                    destination: Quiz(question: Question.allQuestions[0]),
                    label: { BottomText(str: "Retake Quiz")
                    })
                .padding(.vertical)
                
                NavigationLink (
                    destination: ContentView(),
                    label: { BottomText(str: "Exit")
                    })
            }
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    NavigationView{
        ResultsView(viewModel: ResultsViewModel(selectionCount: (8,2),gameStartTime: Date(), gameEndTime: Date()) )
    }

}
