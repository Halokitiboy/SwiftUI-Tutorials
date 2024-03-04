//
//  CircleImage.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/5.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("welcome little one")
            .resizable()
            .scaledToFit()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
