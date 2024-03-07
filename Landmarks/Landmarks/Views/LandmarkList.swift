//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/7.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView{
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow( landmark: landmark)
                }
            }
            .navigationTitle("Landmark")
        } detail: {
            Text("select a landmark")
        }
      
    }
}

#Preview {
    LandmarkList()
}
