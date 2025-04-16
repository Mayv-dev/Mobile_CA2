//
//  JSONLoader.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation

func loadJSON<T: Decodable>(_ filename: String, as type: T.Type) -> T? {
    if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    } else if let url = Bundle.main.url(forResource: filename, withExtension: "txt") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error loading or decoding TXT file: \(error)")
        }
    }
    return nil
}
