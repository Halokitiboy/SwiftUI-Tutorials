//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/7.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoriteOnly = true
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView{

            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow( landmark: landmark)
                    }
                }
            }
            .animation(.default,value: filteredLandmarks)
            .navigationTitle("Landmark")
        } detail: {
            Text("select a landmark")
        }
      
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
