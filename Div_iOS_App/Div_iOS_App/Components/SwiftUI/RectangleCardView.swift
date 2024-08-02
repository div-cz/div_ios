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
    var releaseYear: String?

    var body: some View {
        GeometryReader { geometry in
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
                height: geometry.size.height * cardDisplay.properties.heightRatio * 1.4
            )
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
}

#Preview("More Cards") {
    let movieOne = Movies.mock.movies[0]
    let movieTwo = Movies.mock.movies[1]
    let movieThree = Movies.mock.movies[2]

    return VStack {
        HStack {
            RectangleCardView(
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL,
                genre: movieOne.detail.genres,
                popularity: movieOne.popularity,
                releaseYear: movieOne.releaseYear
            )
            RectangleCardView(
                title: movieTwo.title,
                imageUrl: movieTwo.detail.imgPosterURL,
                genre: movieTwo.detail.genres,
                popularity: nil,
                releaseYear: movieTwo.releaseYear
            )
//            RectangleCardView(
//                title: movieThree.title,
//                imageUrl: movieThree.detail.imgPosterURL,
//                popularity: movieThree.popularity
//            )
//            RectangleCardView(
//                title: movieOne.title,
//                imageUrl: movieOne.detail.imgPosterURL,
//                genre: movieOne.detail.genres,
//                popularity: movieOne.popularity
//            )
//            RectangleCardView(
//                title: movieTwo.title,
//                imageUrl: movieTwo.detail.imgPosterURL,
//                genre: movieTwo.detail.genres,
//                popularity: movieTwo.popularity
//            )
//            RectangleCardView(
//                title: movieThree.title,
//                imageUrl: movieThree.detail.imgPosterURL,
//                popularity: movieThree.popularity
//            )
        }
    }
    .padding(.horizontal)
}



//import SwiftUI
//
//struct RectangleCardView: View {
//    var cardDisplay: CardDisplayType = .classic
//    var title: String
//    var imageUrl: String?
//    var genre: [String]?
//    var popularity: Double?
//    let height: CGFloat
//    let width: CGFloat
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            imageView
//                .frame(height: (height / 3) * 2)
//                .clipped()
//                .cornerRadius(16)
//
//            VStack(alignment: .leading, spacing: 4) {
//                Text(title)
//                    .font(.headline)
//                    .lineLimit(2)
//
//                if let popularity = popularity {
//                    HStack {
//                        Text("\(popularity)")
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                    }
//                    .font(.footnote)
//                }
//                Spacer()
//            }
//            .padding(5)
//            .frame(height: height / 4)
//        }
//        // celková výška a šířka Vstacku
//        .frame(width: width, height: height
//        )
//        .background(Color.black.opacity(0.1))
//        .cornerRadius(16)
//    }
//}
//
//extension RectangleCardView {
//    private var imageView: some View {
//        Group {
//            if let urlString = imageUrl, let url = URL(string: urlString) {
//                AsyncImage(url: url) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                    case .failure:
//                        Image(systemName: "photo")
//                            .resizable()
//                            .scaledToFill()
//
//                    @unknown default:
//                        EmptyView()
//                    }
//                }
//            } else {
//                Image(systemName: "photo")
//                    .resizable()
//                    .scaledToFill()
//            }
//        }
//    }
//}
//
//#Preview("More Cards") {
//    let movieOne = Movies.mock.movies[0]
//    let movieTwo = Movies.mock.movies[1]
//    let movieThree = Movies.mock.movies[2]
//
//    return ScrollView(.horizontal) {
//        HStack(spacing: 20) {
//            RectangleCardView(
//                title: movieOne.title,
//                imageUrl: movieOne.detail.imgPosterURL,
//                genre: movieOne.detail.genres,
//                popularity: movieOne.popularity,
//                height: 300,
//                width: 130
//            )
//            RectangleCardView(
//                title: movieTwo.title,
//                imageUrl: movieTwo.detail.imgPosterURL,
//                genre: movieTwo.detail.genres,
//                popularity: movieTwo.popularity,
//                height: 300,
//                width: 130
//            )
//            RectangleCardView(
//                title: movieThree.title,
//                imageUrl: movieThree.detail.imgPosterURL,
//                height: 300,
//                width: 130
//            )
//            RectangleCardView(
//                title: movieTwo.title,
//                imageUrl: movieTwo.detail.imgPosterURL,
//                height: 300,
//                width: 130
//            )
//            RectangleCardView(
//                title: movieOne.title,
//                imageUrl: movieOne.detail.imgPosterURL,
//                height: 300,
//                width: 130
//            )
//            RectangleCardView(
//                title: movieTwo.title,
//                imageUrl: movieTwo.detail.imgPosterURL,
//                height: 300,
//                width: 130
//            )
//        }
//    }
//    .padding(.horizontal)
//}
