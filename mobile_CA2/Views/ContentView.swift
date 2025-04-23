//
//  ContentView.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import CoreLocation
import SwiftUI
import UIKit
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(
                        Color(
                            red: 236 / 255.0, green: 28 / 255.0,
                            blue: 45 / 255.0)
                    )
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Unicef Poverty")
                            .bold()
                            .font(.title)
                            .colorInvert()
                        Image("people")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 100)
                            .padding(.bottom, 0)
                    }

                    List {
                        NavigationLink("Statistics") { Statistics() }.padding(
                            20)

                        NavigationLink("UN Goals") { UNGoals() }.padding(20)

                        NavigationLink("Causes of Poverty") {
                            CausesOfPoverty()
                        }.padding(20)

                        NavigationLink("Progress & Challenges") {
                            Progress_Challenges()
                        }.padding(20)

                        NavigationLink("Country Comparison") { MapView() }
                            .padding(20)

                        NavigationLink("Quiz") {
                            Quiz(context: context, question: Question.allQuestions[0])
                        }.padding(20)
                        NavigationLink("Scores") { ScoreView() }.padding(20)
                    }
                }
            }.task {
                await notify()
            }
        }
    }
}

func notify() async {
    await notificationPermission()
    await scheduleNotification(title: "You haven't Logged in today", body: "Login today to continue your streak")
}

#Preview {
    ContentView()
}
