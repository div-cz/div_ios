//
//  Movie.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import Foundation

struct Movie: Model {
    var id: Int
    var title: String
    var releaseYear: String?
    var popularity: Double?
    var detail: MovieDetail
}

