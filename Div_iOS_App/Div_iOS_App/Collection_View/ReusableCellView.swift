//
//  ReusableCellView.swift
//  Div_iOS_App
//
//  Created by Christián on 22/07/2024.
//

import SwiftUI

struct ReusableCellView: View {
    let movieOne = Movies.mock.movies[0]
    //var movieName: String = "Ja Padouch 4"
    //    var movieYear: Int = 2024
    //    var movieDescription: String = "Detský animovaný film"
    //    var movieImage: Image = Image(.mockFilm)
    var body: some View {
            RectangleCardView(
                cardDisplay: .classic,
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL)
            .padding()


        //        HStack {
        //        movieImage
        //                  .resizable()
        //                  .scaledToFit()
        //                  .frame(width: 100, height: 100)
        //                  .padding()
        //              VStack(alignment: .leading) {
        //                  HStack {
        //                      Text(movieName)
        //                          .bold()
        //                      Spacer()
        //                      Text(String(movieYear))
        //                  }
        //                  Text(movieDescription)
        //                      .lineLimit(3)
        //              }
        //              .padding()
        //          }
        //          .frame(maxWidth: .infinity, maxHeight: .infinity)
        //          .background(Color.white)
        //          .cornerRadius(10)
        //          .shadow(radius: 5)
        //
        //    }
    }
}

#Preview {
    ReusableCellView()
        .previewLayout(.sizeThatFits)
}

