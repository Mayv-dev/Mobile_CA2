//
//  BottomText.swift
//  mobile_CA2
//
//  Created by Student on 07/14/2025.
//

import SwiftUI

struct BottomText: View {
    let str: String

    var body: some View {
        HStack{
            Spacer()
            Text(str)
                .font(.body)
                .fontWeight(.bold)
                
            Spacer()
        }.background(Color.blue.opacity(0.5))
    }
}

#Preview {
    BottomText(str: "This is the bottom text")
}
