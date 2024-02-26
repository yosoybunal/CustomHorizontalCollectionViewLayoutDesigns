//
//  TitleHeaderCollectionReusableView.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 4.01.2024.
//

import UIKit

final class TitleHeaderCollectionReusableView: UICollectionReusableView {
  
  static let identifier = "TitleHeaderCollectionReusableView"

  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .regular)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    addSubview(label)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    label.frame = CGRect(x: 18, y: 0, width: width-30, height: height)
  }

  func configure(with title: String) {
    label.text = title
    label.lineBreakMode = .byWordWrapping
  }
}
