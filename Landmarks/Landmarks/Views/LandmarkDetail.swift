//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/7.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                  .frame(height: 300)
            CircleImage(image: landmark.image)
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
                Text("About \(landmark.name)")
                     .font(.title2)
                Text(landmark.description)
            }.padding()
            Spacer()
            Text("Created by 夏正春 厉害呀")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .navigationTitle(landmark.name)
        .toolbarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
