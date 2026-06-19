//
//  ContentView.swift
//  StageLog
//
//  Created by Sayor Debbarma on 19/06/26.
//

import SwiftUI
import SwiftData

struct AttendedView: View {
    @Query private var shows: [Show]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(shows) { show in
                Text(show.artistName)
            }
            .navigationTitle("Attended")
            .toolbar {
                Button("Add show!",systemImage: "plus") {
                    modelContext.insert(Show(artistName: "Radiohead", venueName: "NH Stadium", city: "Delhi", date: .now, status: .attended))
                }
            }
        }
    }
}

#Preview {
    AttendedView()
}
