//
//  Score.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation
import SwiftData

@Model
class Score: Identifiable {
    var grade: String
    var gameScore: Int
    var gameTime: String
    var date: Date
    var id: UUID
    
    init(grade: String, gameScore: Int, gameTime: String, date: Date) {
        self.grade = grade
        self.gameScore = gameScore
        self.gameTime = gameTime
        self.date = date
        self.id = UUID()
    }
}
