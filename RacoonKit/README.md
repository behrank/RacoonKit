[![CI Status](https://img.shields.io/travis/behrank/RacoonKit.svg?style=flat)](https://travis-ci.org/behrank/RacoonKit)
[![Version](https://img.shields.io/cocoapods/v/RacoonKit.svg?style=flat)](https://cocoapods.org/pods/RacoonKit)
[![License](https://img.shields.io/cocoapods/l/RacoonKit.svg?style=flat)](https://cocoapods.org/pods/RacoonKit)
[![Platform](https://img.shields.io/cocoapods/p/RacoonKit.svg?style=flat)](https://cocoapods.org/pods/RacoonKit)

## Example
## RacoonKit

RacoonKit is a layout API for iOS platform. RacoonKit is written with Swift 4 and uses Apple Visual Format Language and NSLayoutConstraint SDK.

## Installation [CocoaPods](https://cocoapods.com)

Add RacoonKit to your pod file.

```bash
pod 'RacoonKit'
```
Then type pod install command in project folder via terminal.

```bash
pod install
```

## Usage

### Adding subviews

You may add any UIView based components as just as an array to container view:
```bash
let newView = UIView()
let otherNewView = UIView()
view.addSubviews(views: newView, otherNewView)
```
### Placing a view

Defining view's margins with an array in single line:
```bash
let newView = UIView()
newView.setMargins(.top(value: 8), .left(value: 8), .right(value: 8), .bottom(value: 8))
```

Defining a margin between two views:
```bash
newView.setMarginTo(view: otherNewView, of: .top(value: 8))
newView.setMarginTo(view: otherNewView, of: .right(value: 8))
newView.setMarginTo(view: otherNewView, of: .left(value: 8))
newView.setMarginTo(view: otherNewView, of: .bottom(value: 8))
```

Height and width:
```bash
newView.setHeight(100)
newView.setWidth(125)
newView.setWidthEqualToSuperview()
newView.setHeightEqualToSuperview()
newView.setWidthEqualTo(view: view)
newView.setHeightEqualTo(view: view)
newView.setWidthEqualTo(views: view, view, view)
newView.setHeightEqualTo(views: view, view, view)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
