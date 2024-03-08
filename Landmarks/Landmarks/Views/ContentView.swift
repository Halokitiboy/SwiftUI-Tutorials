//
//  ContentView.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
