//
//  MainTabView.swift
//  StageLog
//
//  Created by Sayor Debbarma on 22/06/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Attended", systemImage: "party.popper.fill") {
                AttendedView()
            }
            Tab("Upcoming", systemImage: "calendar.and.person") {
                UpcomingView()
            }
            Tab("Setting", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
