//
//  ViewController.swift
//  Example
//
//  Created by Berkay Unal on 27.02.2024.
//

import UIKit
import CustomHorizontalCollectionViewLayoutDesigns

class ExampleViewController: CompositionalLayouts {

  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionViews()
  }

  // MARK: - Configure Collection Views

  func configureCollectionViews() {
    ExampleViewController.sections.append(.twoRowsVerticalDesignCollectionView(5))
    ExampleViewController.sections.append(.twoRowsHorizontalDesignCollectionView(10))
    ExampleViewController.sections.append(.oneRowVerticalDesignCollectionView(7))
    ExampleViewController.sections.append(.oneRowHorizontalDesignCollectionView(7))
    ExampleViewController.sections.append(.twoRowsVerticalDesignCollectionView(6))
  }
}

