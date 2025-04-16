//
//  APIManager.swift
//  mobile_CA2
//
//  Created by Student on 16/04/2025.
//

import Foundation

class APIManager {
    static let shared = APIManager()

    private let baseURL = "https://unstats.un.org/SDGAPI/v1/sdg/Goal/List"

    func fetchSDGGoals(completion: @escaping ([SDGGoal]?) -> Void) {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return completion(nil)
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                return completion(nil)
            }
            guard let data = data else {
                print("No data received.")
                return completion(nil)
            }
            do {
                let goals = try JSONDecoder().decode([SDGGoal].self, from: data)
                print("Decoded \(goals.count) SDG goals")
                completion(goals)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
