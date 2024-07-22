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
    
    init() {
          // Inicializácia s layoutom
          let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
          super.init(collectionViewLayout: layout)
        Logger().info("Collection view has been initalized")
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .blue
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Navigation


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration(content: {
            ReusableCellView()
          
        })
        return cell
    }
    
}
extension FilmsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        print("widt of collectionview.bounds.width is \(width)")
                return CGSize(width: width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       }
}
