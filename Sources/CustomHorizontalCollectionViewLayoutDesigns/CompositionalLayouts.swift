//
//  CompositionalLayouts.swift
//  CustomHorizontalCollectionViewLayoutDesigns
//
//  Created by Berkay Unal on 5.01.2024.
//

import UIKit

public class CompositionalLayouts: UIViewController {

  public var compositionalColectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                             collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection in
    return CompositionalLayouts.createLayoutOneRowOneColumn(section: sectionIndex)
  })

  public let spinner: UIActivityIndicatorView = {

    let spinner = UIActivityIndicatorView()
    spinner.tintColor = .label
    spinner.hidesWhenStopped = true
    return spinner
  }()

  public static var sections = [Sections]()
  public let model = DataModelExample()

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(compositionalColectionView)
    view.backgroundColor = .systemBackground
    view.addSubview(spinner)
    registerCollectionViewCells()
  }

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    compositionalColectionView.frame = view.bounds
  }

  public func registerCollectionViewCells() {
    compositionalColectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    compositionalColectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: VerticalCollectionViewCell.identifier)
    compositionalColectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
    compositionalColectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier)
    compositionalColectionView.dataSource = self
    compositionalColectionView.delegate = self
    compositionalColectionView.backgroundColor = .systemBackground
  }

  public static func createLayoutOneRowOneColumn(section: Int) -> NSCollectionLayoutSection {
    let supplementaryViews =  [NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
    let types = sections[section]
    switch section {
    case 0..<20:
      if types == .twoRowsHorizontalDesignCollectionView(0) {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
          widthDimension: .absolute(290),
          heightDimension: .fractionalHeight(1.0)
        )
        )

        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 2)

        let verticalGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(290),
            heightDimension: .absolute(130)),
          repeatingSubitem: item,
          count: 2)

        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(290),
            heightDimension: .absolute(260)),
          repeatingSubitem: verticalGroup,
          count: 1)


        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = supplementaryViews
        return section
      }
      if types == .oneRowHorizontalDesignCollectionView(0) {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
          widthDimension: .absolute(290),
          heightDimension: .fractionalHeight(1.0)
        )
        )

        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 2)

        let verticalGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(290),
            heightDimension: .absolute(130)),
          repeatingSubitem: item,
          count: 1)

        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(290),
            heightDimension: .absolute(130)),
          repeatingSubitem: verticalGroup,
          count: 1)


        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = supplementaryViews
        return section
      }
      else if types == .twoRowsVerticalDesignCollectionView(0){

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0))
        )

        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 2)

        let verticalGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(176),
            heightDimension: .absolute(200)),
          repeatingSubitem: item,
          count: 2)

        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(176),
            heightDimension: .absolute(400)),
          repeatingSubitem: verticalGroup,
          count: 1)

        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = supplementaryViews
        return section
      }
      else {

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0))
        )

        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 2)

        let verticalGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(176),
            heightDimension: .absolute(200)),
          repeatingSubitem: item,
          count: 1)

        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(176),
            heightDimension: .absolute(200)),
          repeatingSubitem: verticalGroup,
          count: 1)

        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = supplementaryViews
        return section
      }

    default:
      let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)
      )
      )

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let group = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .absolute(130)),
        repeatingSubitem: item,
        count: 1)

      let section = NSCollectionLayoutSection(group: group)
      section.boundarySupplementaryItems = supplementaryViews
      return section
    }
  }
}
