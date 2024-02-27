//
//  RowCollectionViewCell.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 4.01.2024.
//

import UIKit

public class HorizontalCollectionViewCell: UICollectionViewCell {

  static let identifier = "VersionOneCollectionViewCell"

  private let headerLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    label.numberOfLines = 0
    return label
  }()

  private let subHeaderLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 14, weight: .light)
    return label
  }()

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)
    contentView.addSubview(headerLabel)
    contentView.addSubview(subHeaderLabel)
    contentView.backgroundColor = .secondarySystemFill
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 10
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  public override func layoutSubviews() {
    super.layoutSubviews()
    let imageSize: CGFloat = contentView.height-10
    let headerLabelSize = headerLabel.sizeThatFits(CGSize(width: contentView.width-imageSize-10, height: contentView.height-10))

    subHeaderLabel.sizeToFit()
    imageView.frame = CGRect(x: 5, y: 5, width: imageSize, height: imageSize)

    headerLabel.frame = CGRect(
      x: Int(imageView.right)+10,
      y: 10,
      width: Int(contentView.width)-Int(imageView.width)-15,
      height: min(80, Int(contentView.height)-10))

    subHeaderLabel.frame = CGRect(
      x: Int(imageView.right)+10,
      y: Int(imageView.bottom)-60,
      width: Int(contentView.width) - Int(imageView.right)-5,
      height: min(80, Int(headerLabelSize.height)))
  }

  public override func prepareForReuse() {
    super.prepareForReuse()
    headerLabel.text = nil
    subHeaderLabel.text = nil
    imageView.image = nil
  }

  func configure(model: DataModelExample) {
    headerLabel.text = model.headerText
    subHeaderLabel.text = model.subHeaderText
    imageView.image = model.cellImage
  }
}
