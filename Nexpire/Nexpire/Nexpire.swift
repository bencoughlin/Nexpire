//
//  nexpire.swift
//  Nexpire
//
//  Created by Ben Coughlin on 22/12/2020.
//

import Foundation

struct Nexpire: Codable {
    let ITEMS:[Film]
}

struct Film: Codable {
    let netflixid:String
    let title:String
    let image:String
    let synopsis:String
    let rating:String
    let _type:String
    let released:String
    let runtime:String
    let largeimage:String
    let unogsdate:String
    let imdbid:String
    let download:String
    
    private enum CodingKeys: String, CodingKey {
        case netflixid,
             title,
             image,
             synopsis,
             rating,
             _type = "type",
             released,
             runtime,
             largeimage,
             unogsdate,
             imdbid,
             download
    }
}



