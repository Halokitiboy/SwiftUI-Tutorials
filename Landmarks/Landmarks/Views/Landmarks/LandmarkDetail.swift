//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/7.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    @GestureState var isDetectingLongPress = false
    @State var totalNumberOfTaps = 0
    @State var doneCounting = false
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        @Bindable var modelData = modelData
        let tap = TapGesture()
            .onEnded { _ in
                print("View tapped!")
            }
        let press = LongPressGesture(minimumDuration: 1)
                 .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                     gestureState = currentState
                 }.onChanged { _ in
                     self.totalNumberOfTaps += 1
                 }.onEnded { _ in
                     self.doneCounting = true
                 }
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                  .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            Text("\(totalNumberOfTaps)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
               
                HStack {
                    Spacer()
                    Button("点击",systemImage: "plus") {
                        self.totalNumberOfTaps += 1
                    }
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(.blue)
                    Spacer()
                }
                .padding(.bottom,10)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                 Circle()
                    .fill(doneCounting ? Color.red : isDetectingLongPress ? Color.yellow : Color.green)
                    .frame(width: 100, height: 100, alignment: .center)
                    .gesture(tap)
                HStack {
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
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
