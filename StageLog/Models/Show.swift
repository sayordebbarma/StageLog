//
//  Show.swift
//  StageLog
//
//  Created by Sayor Debbarma on 19/06/26.
//

import Foundation
import SwiftData

enum ShowStatus: String, Codable, CaseIterable {
    case attended
    case upcoming
}

@Model
final class Show {
    var artistName: String
    var venueName: String
    var city: String
    var date: Date
    var status: ShowStatus

    var rating: Int?
    var notes: String?
    var setList: [String]
    var createdAt: Date

    init(artistName: String, venueName: String, city: String, date: Date, status: ShowStatus) {
        self.artistName = artistName
        self.venueName = venueName
        self.city = city
        self.date = date
        self.status = status
        self.rating = nil
        self.notes = nil
        self.setList = []
        self.createdAt = .now
    }

    @MainActor
    static var preview: ModelContainer = {
        let schema = Schema([Show.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: [configuration])

        let shows = [
            Show(artistName: "Pink Floyd", venueName: "Wembley Stadium", city: "London", date: .now.addingTimeInterval(-86400 * 30), status: .attended),
            Show(artistName: "The Beatles", venueName: "Apple Rooftop", city: "London", date: .now.addingTimeInterval(-86400 * 365), status: .attended),
            Show(artistName: "Coldplay", venueName: "DY Patil Stadium", city: "Mumbai", date: .now.addingTimeInterval(86400 * 60), status: .upcoming)
        ]

        for show in shows {
            container.mainContext.insert(show)
        }

        return container
    }()
}
