//
//  ColumnCollectionViewCell.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 4.01.2024.
//

import UIKit

public class VerticalCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "VersionTwoCollectionViewCell"
  
  private let headerLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
  
  private let subHeaderLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 14, weight: .light)
    label.textAlignment = .center
    return label
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 8
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)
    contentView.addSubview(subHeaderLabel)
    contentView.addSubview(headerLabel)
    contentView.clipsToBounds = true
    contentView.backgroundColor = .secondarySystemFill
    contentView.layer.cornerRadius = 10
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    let imageSize = contentView.height-70
    imageView.frame = CGRect(x: (contentView.width-imageSize)/2, y: 3, width: imageSize, height: imageSize)
    headerLabel.frame = CGRect(x: 3, y: contentView.height-60, width: contentView.width-6, height: 30)
    subHeaderLabel.frame = CGRect(x: 3, y: contentView.height-40, width: contentView.width-6, height: 30)
  }
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    headerLabel.text = nil
    subHeaderLabel.text = nil
  }
  
  func configure(model: DataModelExample) {
    headerLabel.text = model.headerText
    subHeaderLabel.text = model.subHeaderText
    imageView.image = model.cellImage
  }
}
