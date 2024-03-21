# CustomHorizontalCollectionViewLayoutDesigns

This is a UIKit package for adding custom horizontal collection views. I found it hard to add section headers properly positioned at the top left when creating horizontal collectionViews with UIKit. That's why i created this package to ease the process of adding sections and adjusting their section headers.

There are 4 variations of horizontal layouts as below. 
- Two ROWS Horizontal Collection View
- Two COLUMNS Horizontal Collection View
- One ROW Horizontal Collection View
- One COLUMN Horizontal Collection View
<p align="left">
<img src="https://github.com/yosoybunal/CustomHorizontalCollectionViewLayoutDesigns/assets/139717061/2ffbdc86-9faf-4e3a-89e7-585052a8b48f" alt="4 variations" />
</p>

The customization of headers and cells must be implemented via its respective collection view override functions and with a populated data model. An example will be shown in below **Usage** section. 

## Installation

### SPM
Install via Xcode

### Cocoapods
Use the podfile or the terminal to add the package

```bash
pod "CustomHorizontalCollectionViewLayoutDesigns"
```

## Usage

There is no required methods to add once conformed to CompositionLayouts class. As in this below example. The associated value of Int value is the number of cells to populate. 

```swift
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
```

In your view controller you will need to override 3 collectionView methods for customizing your cells and sections.

```swift

  // MARK: - Function to override for clicking action if needed

  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let section = indexPath.section
    let item = indexPath.item
    print("clicked section \(section + 1) and item \(item + 1)")
  }

  // MARK: - Function to override for setting section headers

  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier, for: indexPath) as? TitleHeaderCollectionReusableView else { return UICollectionReusableView() }
    let section = indexPath.section
    header.configure(with: "Category \(section + 1)")
    return header
  }

  // MARK: - Function to override for setting cell properties for each custom collectionView type

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let types = CompositionalLayouts.sections[indexPath.section]
    switch types {

    case .twoRowsHorizontalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath)
              as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
      cell.configure(model: model)
      return cell

    case .twoRowsVerticalDesignCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.identifier, for: indexPath) as?         VerticalCollectionViewCell else { return UICollectionViewCell() }
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
```
> Note: As you would apply in a classic collectionView, you would need a data model if you will make an API call and store the responses. And to be able to populate the cells with the data models you would need UICollectionViewCell, in this example a single one for all collectionView types as HorizontalCollectionViewCell.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
 
