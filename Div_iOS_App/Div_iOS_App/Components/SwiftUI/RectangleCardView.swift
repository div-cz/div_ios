//
//  RectangleCardView.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import SwiftUI

struct RectangleCardView: View {
    var cardDisplay: CardDisplayType = .classic
    var cardTextPosition: CardTextPosition = .under
    var title: String
    var imageUrl: String?
    var genre: [String]?
    var popularity: Double?
    var releaseYear: String?
    var description: String?

    var body: some View {
        GeometryReader { geometry in
            switch cardTextPosition {
            // MARK: - TEXT UNDER
            case .under:
                VStack(alignment: .leading, spacing: 5) {
                    imageView
                        .frame(
                            width: geometry.size.width * cardDisplay.properties.widthRatio,
                            height: geometry.size.height * cardDisplay.properties.heightRatio
                        )
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(geometry.size.width * RectangleCardProperties.cornerRadiusRatio)

                    VStack(alignment: .leading) {
                        itemTitle
                        itemRating
                    }
                    .font(.system(size: geometry.size.width * 0.07))
                    .padding(.horizontal, 5)
                    .frame(
                        width: geometry.size.width * cardDisplay.properties.widthRatio,
                        height: geometry.size.height / 2.6,
                        alignment: .topLeading
                    )
                }
                .padding()
                .frame(
                    width: geometry.size.width * cardDisplay.properties.widthRatio,
                    height: geometry.size.height * cardDisplay.properties.heightRatio * 1.5
                )
            // MARK: - TEXT RIGHTSIDE
            case .rightside:
                HStack(alignment: .top, spacing: 5) {
                    imageView
                        .frame(
                            width: geometry.size.width * cardDisplay.properties.widthRatio,
                            height: geometry.size.height * cardDisplay.properties.heightRatio
                        )
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(geometry.size.width * RectangleCardProperties.cornerRadiusRatio)

                    VStack(alignment: .leading) {
                        itemTitle
                        itemRating
                        itemDescription
                    }
                    .font(.system(size: geometry.size.width * 0.07))
                    .padding([.trailing, .top], 10)
                    .frame(
                        width: geometry.size.width * cardDisplay.properties.widthRatio,
                        height: geometry.size.height * cardDisplay.properties.heightRatio,
                        alignment: .topLeading
                    )
                }
                .frame(
                    width: geometry.size.width * cardDisplay.properties.widthRatio * 2,
                    height: geometry.size.height * cardDisplay.properties.heightRatio
                )
            }

        }
        .aspectRatio(1, contentMode: .fit)
    }
}

extension RectangleCardView {
    private var imageView: some View {
        Group {
            if let urlString = imageUrl, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    switch image {
                    case .success(let image):
                        image
                            .resizable()
                    case .failure:
                        Image(.mockFilm)
                            .resizable()
                    default:
                        Image(.divLogoText)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            }
        }
    }

    private var itemTitle: some View {
        Group {
            if let releaseYear = releaseYear, !releaseYear.isEmpty {
                Text("\(title) (\(releaseYear))")
            } else {
                Text(title)
            }
        }
        .bold()
        .lineLimit(2)
    }

    private var itemRating: some View {
        Group {
            if let popularity = popularity {
                HStack {
                    Text(String(popularity))
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .foregroundColor(.black.opacity(0.7))
            }
        }
    }

    private var itemDescription: some View {
        Text(description ?? "")
            .padding(.top)
    }
}

#Preview("Text - right side") {
    let movieOne = Movies.mock.movies[0]

    return RectangleCardView(
        cardDisplay: .classic,
        cardTextPosition: .rightside,
        title: movieOne.title,
        imageUrl: movieOne.detail.imgPosterURL,
        genre: movieOne.detail.genres,
        popularity: movieOne.popularity,
        releaseYear: movieOne.releaseYear,
        description: movieOne.detail.description
    )
    .padding(.horizontal, 130)
}

#Preview("Text - under") {
    let movieOne = Movies.mock.movies[0]
    let movieTwo = Movies.mock.movies[1]
    let movieThree = Movies.mock.movies[2]

    return VStack {
        HStack {
            RectangleCardView(
                cardDisplay: .classic,
                cardTextPosition: .under,
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL,
                genre: movieOne.detail.genres,
                popularity: movieOne.popularity,
                releaseYear: movieOne.releaseYear
            )
            RectangleCardView(
                cardDisplay: .classic,
                cardTextPosition: .under,
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                genre: movieTwo.detail.genres,
                popularity: nil,
                releaseYear: movieTwo.releaseYear
            )
        }
    }
    .padding(.leading)
}

#Preview("Card - wide") {
    let movieOne = Movies.mock.movies[0]

    return RectangleCardView(
        cardDisplay: .wide,
        cardTextPosition: .under,
        title: movieOne.title,
        imageUrl: movieOne.detail.imgPosterURL,
        genre: movieOne.detail.genres,
        popularity: movieOne.popularity,
        releaseYear: movieOne.releaseYear,
        description: movieOne.detail.description
    )
    .padding(.horizontal, 130)
}
