//
//  LaunchView.swift
//  mobile_CA2
//
//  Created by Student on 07/03/2025.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    Color(red: 236 / 255.0, green: 28 / 255.0, blue: 45 / 255.0)
                )
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)

        }

    }
}
#Preview {
    LaunchView()
}
