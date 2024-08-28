//
//  GenericCollectionCollectionViewCell.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 28.08.2024.
//

import UIKit

class MyCell: UICollectionViewCell {
    weak var textLabel: UILabel!

      override init(frame: CGRect) {
          super.init(frame: frame)

          let textLabel = UILabel(frame: .zero)
          textLabel.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(textLabel)
          NSLayoutConstraint.activate([
              textLabel.topAnchor.constraint(
                  equalTo: contentView.topAnchor
              ),
              textLabel.bottomAnchor.constraint(
                  equalTo: contentView.bottomAnchor
              ),
              textLabel.leadingAnchor.constraint(
                  equalTo: contentView.leadingAnchor
              ),
              textLabel.trailingAnchor.constraint(
                  equalTo: contentView.trailingAnchor
              ),
          ])
          self.textLabel = textLabel

          contentView.backgroundColor = .lightGray
          textLabel.textAlignment = .center
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)

          fatalError("Interface Builder is not supported!")
      }

      override func awakeFromNib() {
          super.awakeFromNib()

          fatalError("Interface Builder is not supported!")
      }

      override func prepareForReuse() {
          super.prepareForReuse()

          textLabel.text = nil
      }
}

#Preview {
    MyCell()
}
