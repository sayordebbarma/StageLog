//
//  StageLogApp.swift
//  StageLog
//
//  Created by Sayor Debbarma on 19/06/26.
//

import SwiftUI
import SwiftData

@main
struct StageLogApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: Show.self)
    }
}
