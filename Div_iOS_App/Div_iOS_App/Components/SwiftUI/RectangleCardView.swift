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
    var genre: [String]?
    var popularity: Double?
    let height: CGFloat
    let width: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            imageView
                .frame(height: (height / 3) * 2)
                .clipped()
                .cornerRadius(16)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .lineLimit(2)

                if let popularity = popularity {
                    HStack {
                        Text("\(popularity)")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .font(.footnote)
                }
                Spacer()
            }
            .padding(5)
            .frame(height: height / 4)
        }
        // celková výška a šířka Vstacku
        .frame(width: width, height: height
        )
        .background(Color.black.opacity(0.1))
        .cornerRadius(16)
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
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()

                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

#Preview("More Cards") {
    let movieOne = Movies.mock.movies[0]
    let movieTwo = Movies.mock.movies[1]
    let movieThree = Movies.mock.movies[2]

    return ScrollView(.horizontal) {
        HStack(spacing: 20) {
            RectangleCardView(
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL,
                genre: movieOne.detail.genres,
                popularity: movieOne.popularity,
                height: 300,
                width: 130
            )
            RectangleCardView(
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                genre: movieTwo.detail.genres,
                popularity: movieTwo.popularity,
                height: 300,
                width: 130
            )
            RectangleCardView(
                title: movieThree.title,
                imageUrl: movieThree.detail.imgPosterURL,
                height: 300,
                width: 130
            )
            RectangleCardView(
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                height: 300,
                width: 130
            )
            RectangleCardView(
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL,
                height: 300,
                width: 130
            )
            RectangleCardView(
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                height: 300,
                width: 130
            )
        }
    }
    .padding(.horizontal)
}
