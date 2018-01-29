A fully customisable subclass of the `CAReplicatorLayer` which will used to display the Ripple animation.


## Preview

You'll be able to create buttons like these by using only the interface builder:

![async](media/RippleAnimationVideo.gif)

## Requirements
-	Swift 4
-	iOS 9.0+
-	Xcode 9

## Install

To integrate KPRippleAnimation into your Xcode project, just copy and paste `KPRippleLayer.swift` file in your project. And that's it. :)


## Usage
### Add/Start Ripple Animation
```swift

// Create an object of KPRippleLayer
let objRippleLayer = KPRippleLayer()

// Define the position
objRippleLayer.position = CGPoint(x: view.layer.bounds.midX, y: view.layer.bounds.midY)

// Add as a sublyer
view.layer.addSublayer(objRippleLayer)

// Start the animation
objRippleLayer.startAnimation()

```

### Stop Ripple Animation
```swift

// Stop the animation
objRippleLayer.stopAnimation()

```


### Change the property
```swift

/// Radius of the Ripple. Default value is `100.0`
public var rippleRadius: CGFloat = 100.0

/// Number of Ripple you wanted to show. Default value is `3`
public var rippleCount: Int = 3

/// Color of the Ripple border. Default value is `UIColor.orange`
public var rippleColor: UIColor = UIColor.orange

/// Color of the Ripple Backgroud Color. Default value is `UIColor.yellow`
public var rippleBackgroudColor: UIColor = UIColor.yellow

/// Number of times you wanted to repeate the Ripple animation. Default value is `1000.0`
public var rippleRepeatCount: CGFloat = 1000.0

/// Width of the Ripple border. Default value is `4`
public var rippleWidth: CGFloat = 4

```

## Author

Kushal Panchal

- [Website](http://www.kushalpanchal.com/)
- [Twitter](https://twitter.com/kushal211)

## License
```
MIT License

Copyright (c) 2018

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
