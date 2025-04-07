//
//  KeychainError.swift
//  mobile_CA2
//
//  Created by Student on 14/03/2025.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
