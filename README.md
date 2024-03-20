# CustomHorizontalCollectionViewLayoutDesigns

This is a UIKit package for adding custom horizontal collection views.

There are 4 variations of horizontal layouts as below. The customization of headers and cells must be implemented via its respective collection view override functions and with a populated data model. An example will be shown in below **Usage** section. 

## Installation

### SPM
Install via Xcode

### Cocoapods
Use the podfile or the terminal to add the package

```bash
pod "CustomHorizontalCollectionViewLayoutDesigns"
```

## Usage

There is no required methods to add once conformed to CompositionLayouts class. Asin this below example 

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

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
 
