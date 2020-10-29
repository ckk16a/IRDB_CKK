//
//  MediaDataModel.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/22/20.
//

import UIKit

class MediaDataModel: Codable {
    var franchise: [Franchise]
}

class Franchise: Codable{
    let franchiseName: String
    let entries: [Entry]
}

class Entry: Codable{
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episodes: Int?
    let studio: String
    let imageURL: String
    let description: String
    let summary: String
    let starring: [Cast]
}

class Cast: Codable{
    let actorName: String
    let role: String
}
