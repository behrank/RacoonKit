## RacoonKit

RacoonKit is an layout API for iOS platform. RacoonKit is written with Swift and compatible with Swift 4.0.

## Installation [CocoaPods](https://cocoapods.com)

Add RacoonKit to your pod file

```bash
pod 'RacoonKit'
```
Then type pod install command in project folder via terminal

```bash
pod install
```

## Usage

### Adding subviews

You may add any UIView based components as just as an array to container view.

```bash
        let newView = UIView()
        view.addSubviews(views: newView)
```
### Placing a view

You can define views margins with an array in single line.

```bash
        let newView = UIView()
        newView.setMargins(.top(value: 8), .left(value: 8), .right(value: 8), .bottom(value: 8))
```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)