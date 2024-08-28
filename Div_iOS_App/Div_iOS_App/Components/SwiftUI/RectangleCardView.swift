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
    var width: CGFloat
    var height: CGFloat

    var body: some View {
            switch cardTextPosition {
            // MARK: - TEXT UNDER
            case .under:
                VStack(alignment: .leading, spacing: 5) {
                    imageView
                        .frame(
                            width: width,
                            height: height
                        )
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16)

                    VStack(alignment: .leading) {
                        itemTitle
                        itemRating
                    }
                    .padding(.horizontal, 5)
                    .frame(
                        width: width,
                        height: height,
                        alignment: .topLeading
                    )
                }
                .padding()
                .frame(
                    width: width,
                    height: height
                )
            // MARK: - TEXT RIGHTSIDE
            case .rightside:
                HStack(alignment: .top, spacing: 5) {
                    imageView
                        .frame(
                            width: width,
                            height: height
                        )
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16)

                    VStack(alignment: .leading) {
                        itemTitle
                        itemRating
                        itemDescription
                    }
                    .padding([.trailing, .top], 10)
                    .frame(
                        width: width,
                        height: height,
                        alignment: .topLeading
                    )
                }
                .frame(
                    width: width,
                    height: height
                )
                .padding()
            }
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
                        Image(systemName: "photo")
                            .resizable()
                    default:
                        Image(systemName: "photo")
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
        .minimumScaleFactor(0.5)
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
        .font(.footnote)
        .minimumScaleFactor(0.5)
    }

    private var itemDescription: some View {
        Text(description ?? "")
            .padding(.top, 1)
            .minimumScaleFactor(0.5)
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
        description: movieOne.detail.description,
        width: 150,
        height: 300
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
                releaseYear: movieOne.releaseYear,
                width: 150,
                height: 300
            )
            RectangleCardView(
                cardDisplay: .classic,
                cardTextPosition: .under,
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                genre: movieTwo.detail.genres,
                popularity: nil,
                releaseYear: movieTwo.releaseYear,
                width: 150,
                height: 300
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
        description: movieOne.detail.description,
        width: 150,
        height: 300
    )
    .padding(.horizontal, 130)
}
