//
//  MediaDataModel.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/22/20.
//

import UIKit

class MediaDataModel: Codable {
    var batmanSeries: [BatmanSeries]
}

class BatmanSeries: Codable{
    let seriesType: String
    let media: [Media]
}

class Media: Codable{
    let mediaName: String
    let directorOrCreator: String
    let releaseDate: String
    let genre: String
    let runTime: String
    let imageLink: String
    let whereToWatch: String
    let storyLine: String
    let cast: [Featured]
}

class Featured: Codable{
    let actorName: String
    let role: String
}
