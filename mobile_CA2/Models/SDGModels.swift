//
//  SDGModels.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation

struct SDGGoal: Codable {
    let code: String
    let title: String
    let description: String
    let uri: String
    let targets: [Target]?
}

struct Target: Codable {
    let code: String
    let title: String
    let description: String
    let uri: String
    let indicators: [Indicator]?
}

struct Indicator: Codable {
    let code: String
    let description: String
    let uri: String
    let series: [Series]?
}

struct Series: Codable {
    let code: String
    let description: String
    let uri: String
}
