//
//  CircleImage.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/5.
//

import SwiftUI


struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImage(image: Image("turtlerock"))
}
