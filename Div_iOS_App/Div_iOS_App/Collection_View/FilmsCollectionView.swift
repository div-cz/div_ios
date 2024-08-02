//
//  FilmsCollectionView.swift
//  Div_iOS_App
//
//  Created by Christián on 22/07/2024.
//

import UIKit
import os
import SwiftUI

private let reuseIdentifier = "Cell"

class FilmsCollectionView: UICollectionViewController {
    let layout = UICollectionViewFlowLayout()
    let movieOne = Movies.mock.movies[0]

    init() {
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        Logger().info("Collection view has been initalized")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .lightGray
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Navigation
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration(content: {
            RectangleCardView(
                cardDisplay: .wide,
                cardTextPosition: .under,
                title: movieOne.title,
                imageUrl: movieOne.detail.imgPosterURL,
                genre: movieOne.detail.genres,
                popularity: movieOne.popularity,
                releaseYear: movieOne.releaseYear,
                description: movieOne.detail.description
            )
             .padding(.trailing, 70)
        }
        )
        return cell
    }
}

extension FilmsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Velikost karty RectangleCardView
        return CGSize(width: 230, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Nastavenie minimálnej vzdialenosti medzi riadkami
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Nastavenie minimálnej vzdialenosti medzi položkami (sloupci)
        return 5
    }
}
