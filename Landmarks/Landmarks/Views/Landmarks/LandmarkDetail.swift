//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/7.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                  .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
//                Text("Turtle Rock")
//                    .font(.title2)
//                .foregroundColor(Color.pink)
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
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}
