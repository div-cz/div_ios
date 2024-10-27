//
//  TestDiffableDataSourceViewController.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 01.09.2024.
//

import UIKit

class TestDiffableDataSourceViewController: UIViewController {
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    enum Section {
        case main
        case movie
    }

    struct Item: Hashable {
        let id: UUID
        let title: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Inicializace a nastavení UICollectionView
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)

        // Nastavení data source
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.contentView.layer.cornerRadius = 8

            if indexPath.section == 0 {
                cell.backgroundColor = .orange
            } else {
                cell.backgroundColor = .blue
            }
            return cell
        }

        // Vytvoření snapshotu
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main, .movie])
        snapshot.appendItems([
            Item(id: UUID(), title: "Item1"),
            Item(id: UUID(), title: "Item2"),
            Item(id: UUID(), title: "Item3"),
            Item(id: UUID(), title: "Item4"),
            Item(id: UUID(), title: "Item5"),
            Item(id: UUID(), title: "Item6")
        ], toSection: .main)

        snapshot.appendItems([
            Item(id: UUID(), title: "Movie1"),
            Item(id: UUID(), title: "Movie2"),
            Item(id: UUID(), title: "Movie3"),
            Item(id: UUID(), title: "Movie3"),
            Item(id: UUID(), title: "Movie3"),
            Item(id: UUID(), title: "Movie3")
        ], toSection: .movie)


        dataSource.apply(snapshot, animatingDifferences: true)

        func createLayout() -> UICollectionViewLayout {
               return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                   switch sectionIndex {
                   case 0:
                       // Layout pro sekci 'main'
                       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                       let item = NSCollectionLayoutItem(layoutSize: itemSize)

                       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
                       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                       let section = NSCollectionLayoutSection(group: group)
                       section.interGroupSpacing = 10
                       section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                       return section

                   case 1:
                                  // Layout pro sekci 'movie' s horizontálním skrolováním
                                  let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1.0))
                                  let item = NSCollectionLayoutItem(layoutSize: itemSize)

                                  let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(150))
                                  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                                  let section = NSCollectionLayoutSection(group: group)
                                  section.orthogonalScrollingBehavior = .continuous // Nastavení horizontálního skrolování
                                  section.interGroupSpacing = 10
                                  section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                                  return section

                              default:
                                  return nil
                   }
               }
           }
    }
}

#Preview {
    TestDiffableDataSourceViewController()
}
