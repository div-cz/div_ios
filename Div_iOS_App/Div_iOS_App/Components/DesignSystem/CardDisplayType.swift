//
//  CardDisplay.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import Foundation

enum CardDisplayType {
    case classic, wide

    private static let widthRatio: CGFloat = 0.8
    private static let heightRatio: CGFloat = 1.2

    var properties: RectangleCardProperties {
        switch self {
        case .classic:
            return RectangleCardProperties(widthRatio: Self.widthRatio, heightRatio: Self.heightRatio)
        case .wide:
            return RectangleCardProperties(widthRatio: Self.heightRatio, heightRatio: Self.widthRatio)
        }
    }
}
