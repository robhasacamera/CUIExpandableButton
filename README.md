# CUIExpandableButton

A SwiftUI button that expands to reveal more content.

![CUIExpandableButton Demo](Assets/demo.gif)

[![package build workflow](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/package.yml/badge.svg)](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/package.yml)
[![sample app build workflow](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/sample_app.yml/badge.svg)](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/sample_app.yml)
[![package build workflow](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/test.yml/badge.svg)](https://github.com/robhasacamera/CUIExpandableButton/actions/workflows/test.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Frobhasacamera%2FCUIExpandableButton%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/robhasacamera/CUIExpandableButton)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Frobhasacamera%2FCUIExpandableButton%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/robhasacamera/CUIExpandableButton)

*CUIExpandableButton is part of the Crystal UI framework (under developement). This framework is working to bring a suite of UI components that utilize [SwiftUI Material](https://developer.apple.com/documentation/swiftui/material) for it's background element.* 

## Usage

To create a simple CUIExpandableButton, you can use an SF Symbol for your icon.

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "gearshape.fill"
) {
    Text("My content")
}
```

If you'd like more control, you can provide a custom icon for the button instead.

```swift
CUIExpandableButton(
    expanded: $expanded
) {
    Image("icon")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 26, height: 26)
} content: {
    Text("My content")
}
```

*Don't forget to import CUIExpandableButton, before using it:*

```swift
import CUIExpandableButton
```

## Customization

![CUIExpandableButton Style Options](Assets/customize.gif)

There are several ways to customize CUIExpandableButton, including:
- Adding a title and\or subtitle.
- Hiding or showing various elements of the button when expanded or collapsed.
- Using `foregroundColor(_:)` to customize color.
- Applying `fontWeight(_:)` to the icon and header elements. (>=iOS 16.0)

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "flame.fill",
    title: "Customize",
    subtitle: "Lots of options"
) {
    Text("You can customize the title/subtitle, header, color, and more!")
       .frame(width: 200)
       .padding(8)
}
.collapsedOptions(.showTitle)
.expandedOptions(.hideIcon)
.foregroundColor(.yellow)
```

## Actions

You can add an action when the button is expanded or collapsed using the built in controls.

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "bell.fill",
) {
    Text("Additional actions can be performed when expanding/collpasing")
        .frame(width: 200)
        .padding(8)
} action: {
    print("Button was pressed")
}
```

There is also an option to provide no content to show, in case you want a non-expanding button that's styled like your expanding button.

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "bell.fill",
) {
    print("Button was pressed")
}
```

## Installation

CUIExpandableButton supports Swift Package Manager. To use it the following to your `Package.swift` file:

```
dependencies: [
    .package(name: "CUIExpandableButton", url: "https://github.com/robhasacamera/CUIExpandableButton.git", from: "0.9.0")
],
```

Support for CocoaPods and Carthage are being considered for future releases.

## Addtional Notes

A sample project, `ButtonDemo.xcodeproj`, can be found in the `SampleApp` folder.

It is worth noting that CUIExpandableButton fully supports dynamic type variants, dark mode, and the right to left layout direction.

## Future Plans

Below are some of the current limitations for CUIExpandableButton. These are being considered for future releases.
- Background corner radius customization when expanded
- Other backgrounds materials
