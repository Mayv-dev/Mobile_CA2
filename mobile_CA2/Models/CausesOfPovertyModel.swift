//
//  CausesOfPovertyModel.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation


struct Cause: Codable, Identifiable{
    let id: Int
    let title: String
    let description: String
}


struct CausesData: Codable {
    let causesOfPoverty: [Cause]
}

