//
//  Keychain.swift
//  mobile_CA2
//
//  Created by Student on 14/03/2025.
//

import Foundation


func createKeychain(credentials: Credentials) -> Result<Void, KeychainError> {
    let account = credentials.username
    let password = credentials.password.data(using: String.Encoding.utf8)!
    
    var query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrAccount as String: account,
                                kSecAttrServer as String: Constants.server,
                                kSecValueData as String: password]
    
    let status = SecItemAdd(query as CFDictionary, nil)
    guard status == errSecSuccess else {
        return .failure(KeychainError.unhandledError(status: status))
    }
    
    return .success(())
}

func readKeyChain() -> Result<Credentials, KeychainError> {
    var query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrServer as String: Constants.server,
                                kSecMatchLimit as String: kSecMatchLimitOne,
                                kSecReturnAttributes as String: true,
                                kSecReturnData as String: true]
    
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    guard status != errSecItemNotFound else {
        return .failure(.noPassword)
    }
    guard status == errSecSuccess else {
        return .failure(.unhandledError(status: status))
    }
    
    guard let existingItem = item as? [String: Any],
        let passwordData = existingItem[kSecValueData as String] as? Data,
        let password = String(data: passwordData, encoding: String.Encoding.utf8),
        let account = existingItem[kSecAttrAccount as String] as? String
    else {
        return .failure(.unexpectedPasswordData)
    }
    
    return .success(Credentials(username: account, password: password))
}

func updateKeyChain(credentials: Credentials) -> Result<Void, KeychainError> {
    let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrServer as String: Constants.server]
    
    let account = credentials.username
    let password = credentials.password.data(using: String.Encoding.utf8)!
    let attributes: [String: Any] = [kSecAttrAccount as String: account,
                                     kSecValueData as String: password]
    
    let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    guard status != errSecItemNotFound else {
        return .failure(.noPassword)
    }
    guard status == errSecSuccess else {
        return .failure(.unhandledError(status: status))
    }
    
    return .success(())
}

func deleteKeychain() -> Result<Void, KeychainError> {
    let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrServer as String: Constants.server]
    
    let status = SecItemDelete(query as CFDictionary)
    guard status == errSecSuccess || status == errSecItemNotFound else {
        return .failure(.unhandledError(status: status))
    }
    
    return .success(())
}
