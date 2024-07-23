//
//  MovieDetail.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import Foundation

struct MovieDetail: Model {
    var id: Int
    var title: String
    var description: String?
    var releaseYear: String?
    var duration: Int?
    var popularity: Double?
    var genres: [String]?
    var directors: [String]?
    var actors: [String]?
    var imgPoster: String?

    // COMPUTED PROPERTIES
    var imgPosterURL: String {
        if let imgPoster = imgPoster {
            return MoviesEndpoint.schemaImgPoster.rawValue + imgPoster
        }
        return ""
    }
}
