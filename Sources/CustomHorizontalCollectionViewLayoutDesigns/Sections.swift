//
//  Sections.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 5.01.2024.
//

import Foundation

public enum Sections: Equatable {
  public static func == (lhs: Sections, rhs: Sections) -> Bool {
    return lhs.sectionName == rhs.sectionName
  }

  case twoRowsHorizontalDesignCollectionView(Int)
  case twoRowsVerticalDesignCollectionView(Int)
  case oneRowVerticalDesignCollectionView(Int)
  case oneRowHorizontalDesignCollectionView(Int)

  //MARK: - 4 Horizontal Collection View Cases

  var sectionName: String {
    switch self {
    case .twoRowsHorizontalDesignCollectionView:
      return "SECTION 1"
    case .twoRowsVerticalDesignCollectionView:
      return "SECTION 2"
    case .oneRowVerticalDesignCollectionView:
      return "SECTION 3"
    case .oneRowHorizontalDesignCollectionView:
      return "SECTION 4"
    }
  }
}
