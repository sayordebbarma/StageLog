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
    // let id = UUID() - macro automatically generates it
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
    
}
