//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 夏正春 on 2024/3/4.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
