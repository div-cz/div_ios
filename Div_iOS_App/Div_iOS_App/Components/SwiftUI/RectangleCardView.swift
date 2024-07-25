//
//  RectangleCardView.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import SwiftUI

struct RectangleCardView: View {
    var cardDisplay: CardDisplayType = .classic
    var title: String
    var imageUrl: String?

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 5) {
                imageView
                    .frame(
                        width: geometry.size.width * cardDisplay.properties.widthRatio,
                        height: geometry.size.height * cardDisplay.properties.heightRatio
                    )
                    .cornerRadius(geometry.size.width * RectangleCardProperties.cornerRadiusRatio)
                Text(title)
                    .lineLimit(3)
                    .padding(.leading, 1)
                    .font(.footnote)
                    .frame(
                        width: geometry.size.width * cardDisplay.properties.widthRatio,
                        height: geometry.size.height / 2,
                        alignment: .topLeading
                    )
            }
            .border(Color.black, width: 1)
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

extension RectangleCardView {
    private var imageView: some View {
        Group {
            if let urlString = imageUrl, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

#Preview {
    let movieOne = Movies.mock.movies[0]
    let movieTwo = Movies.mock.movies[1]

    return VStack {
        HStack {
            RectangleCardView(title: movieOne.title, imageUrl: movieOne.detail.imgPosterURL)
            RectangleCardView(title: movieTwo.title, imageUrl: movieTwo.detail.imgPosterURL)
            RectangleCardView(title: movieOne.title, imageUrl: movieOne.detail.imgPosterURL)
//            RectangleCardView(title: movieTwo.title, imageUrl: movieTwo.detail.imgPosterURL)
//            RectangleCardView(title: movieOne.title, imageUrl: movieOne.detail.imgPosterURL)
//            RectangleCardView(title: movieTwo.title, imageUrl: movieTwo.detail.imgPosterURL)
        }
    }
    .padding(.horizontal)
}
