//
//  LoginView.swift
//  mobile_CA2
//
//  Created by Student on 14/03/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoggedIn: Bool = login()
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            ZStack {
                Rectangle()
                    .fill(Color(red: 236/255.0,green: 28/255.0,blue:45/255.0))
                    .ignoresSafeArea()
                VStack {
                    Image("logo_people")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    TextField("Username", text: $username)
                        .background(Color.white)
                    SecureField("Password", text: $password)
                        .background(Color.white)
                    
                    Button(
                        action:{
                            newLogin(username: username, password: password)
                        },
                        label: {
                            Text("Login")
                                .background(Color.white)
                        }
                    )
                }
            }
        }
    }
}

func newLogin(username: String, password: String) {
    let credentials = Credentials(username: username, password: password)
    
        switch createKeychain(credentials: credentials) {
        case .success:
            print( "Login created")
        case .failure(let error):
            print("Login failed: \(error)")
        }
}

func login() -> Bool {
    switch readKeyChain() {
    case.success:
        print( "Login successful")
        return true
    case .failure(let error):
        print( "Login failed \(error)")
        return false
    }
}

#Preview {
    LoginView()
}
