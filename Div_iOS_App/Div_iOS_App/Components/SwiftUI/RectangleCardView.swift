//
//  RectangleCardView.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import SwiftUI

struct RectangleCardView: View {
    var title: String
    var image: String?

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
        Text(title)

    }
}

#Preview {
    let movieOne = Movies.mock.movies[0]
    let movieTwo = Movies.mock.movies[1]

    return VStack {
        RectangleCardView(title: movieOne.title, image: movieOne.detail.imgPosterURL)
        RectangleCardView(title: movieTwo.title, image: movieTwo.detail.imgPosterURL)
    }
}
