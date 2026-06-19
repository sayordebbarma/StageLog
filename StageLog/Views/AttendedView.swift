//
//  ContentView.swift
//  StageLog
//
//  Created by Sayor Debbarma on 19/06/26.
//

import SwiftUI
import SwiftData

struct AttendedView: View {
    @Query(sort: \Show.date, order: .reverse) private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    @State private var vm = AttendedViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if vm.filteredShows(allShows).isEmpty {
                    ContentUnavailableView(
                        "No concerts attended",
                        systemImage: "sparkle.magnifyingglass"
                    )
                } else {
                    List {
                        ForEach(vm.filteredShows(allShows)) { show in
                            Text(show.artistName)
                        }
                        .onDelete { indexSet in
                            let shows = vm.filteredShows(allShows)

                            for index in indexSet {
                                vm.delete(shows[index], context: modelContext)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Attended")
            .toolbar {
                Button("Add show!", systemImage: "plus") {
                    modelContext.insert(
                        Show(
                            artistName: "Radiohead",
                            venueName: "NH Stadium",
                            city: "Delhi",
                            date: .now,
                            status: .attended
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    AttendedView()
        .modelContainer(Show.preview)
}
