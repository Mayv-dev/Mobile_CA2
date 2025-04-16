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
            Rectangle()
                .fill(
                    Color(red: 236 / 255.0, green: 28 / 255.0, blue: 45 / 255.0)
                )
                .ignoresSafeArea()

            VStack {

                Text("Unicef Poverty")
                    .bold()
                    .font(.title)
                    .colorInvert()

                ZStack {

                    VStack {
                        Spacer()
                        HStack {
                            Text("Final Score: ")
                                .foregroundColor(Color.white)
                            Text(viewModel.finalPercentText)
                                .foregroundColor(Color.white)
                        }
                        .font(.title)
                        .padding()
                        HStack {
                            Text("Grade:")
                            Text(viewModel.letterGradeText)
                                .padding()
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        Text("Total time: \(viewModel.totalGameTimeText)")
                        Spacer()
                        Text(viewModel.CorrectGuesses)
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                        Text(viewModel.WrongGuesses)
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                        Spacer()
                        NavigationLink(
                            destination: Quiz(
                                question: Question.allQuestions[0]),
                            label: {
                                BottomText(
                                    str: NSLocalizedString(
                                        "Retake Quiz",
                                        comment: "Button to restart quiz")
                                )
                                .foregroundColor(Color.white)
                            }
                        )
                        .padding(.vertical)

                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                BottomText(
                                    str: NSLocalizedString(
                                        "Exit",
                                        comment:
                                            "Button to exit back to main menu"))
                            }
                        )
                        .foregroundColor(Color.white)
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    NavigationView {
        ResultsView(
            viewModel: ResultsViewModel(
                selectionCount: (8, 2), gameStartTime: Date(),
                gameEndTime: Date()))
    }

}
