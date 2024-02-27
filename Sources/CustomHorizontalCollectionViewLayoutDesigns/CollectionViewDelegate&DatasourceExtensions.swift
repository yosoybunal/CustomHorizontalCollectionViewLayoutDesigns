//
//  DelegateDatasourceExtensions.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 6.01.2024.
//

import UIKit

extension CompositionalLayouts: UICollectionViewDataSource, UICollectionViewDelegate {

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let sections = CompositionalLayouts.sections[section]
    switch sections {
    case .twoRowsVerticalDesignCollectionView(let count):
      return count
    case .twoRowsHorizontalDesignCollectionView(let count):
      return count
    case .oneRowVerticalDesignCollectionView(let count):
      return count
    case .oneRowHorizontalDesignCollectionView(let count):
      return count
    }
  }

  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }

  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return CompositionalLayouts.sections.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let types = CompositionalLayouts.sections[indexPath.section]
    switch types {

    case .twoRowsHorizontalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath)
              as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
      cell.configure(model: model)
      return cell

    case .twoRowsVerticalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.identifier, for: indexPath) as? VerticalCollectionViewCell else { return UICollectionViewCell() }
      cell.configure(model: model)
      return cell

    case .oneRowVerticalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.identifier, for: indexPath) as? VerticalCollectionViewCell else { return UICollectionViewCell() }
      cell.configure(model: model)
      return cell

    case .oneRowHorizontalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath)
              as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
      cell.configure(model: model)
      return cell
    }
  }

  public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    return UICollectionReusableView()
  }
}
