//
//  Model+Protocol.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import Foundation

protocol Model: Codable, Identifiable {
    var id: Int { get }
}
