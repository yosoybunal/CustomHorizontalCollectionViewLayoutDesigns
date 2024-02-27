//
//  ExampleViewController.swift
//
//
//  Created by Berkay Unal on 27.02.2024.
//

import UIKit

class ExampleViewController: CompositionalLayouts {

  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionViews()
  }

  // MARK: - Configure Collection Views

  private func configureCollectionViews() {
    ExampleViewController.sections.append(.twoRowsVerticalDesignCollectionView(5))
    ExampleViewController.sections.append(.twoRowsHorizontalDesignCollectionView(10))
    ExampleViewController.sections.append(.oneRowVerticalDesignCollectionView(7))
    ExampleViewController.sections.append(.oneRowHorizontalDesignCollectionView(7))
    ExampleViewController.sections.append(.twoRowsVerticalDesignCollectionView(6))
  }

  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let section = indexPath.section
    let item = indexPath.item
    print("clicked section \(section + 1) and item \(item + 1)")
  }

  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier, for: indexPath) as? TitleHeaderCollectionReusableView else { return UICollectionReusableView() }
    let section = indexPath.section
    header.configure(with: "Section \(section + 1)")
    return header
  }
}
