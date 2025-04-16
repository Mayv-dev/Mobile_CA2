//
//  StatisticsModel.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation

struct Info: Codable, Identifiable {
    let id: Int
    let title: String
    let value: String
    let description: String
}

struct StatsData: Codable {
    let causesOfPoverty: [Info]
}
