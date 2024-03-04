//
//  ContentView.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                  .frame(height: 300)
            CircleImage()
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title2)
                .foregroundColor(Color.pink)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("beijing")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About Turtle Rock")
                     .font(.title2)
                      Text("Descriptive text goes here.")
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
