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
import CUIExpandableButton
import SwiftUI

struct ContentView: View {
    @State
    var expanded: Bool = false
    
    var body: some View {
        CUIExpandableButton(
            expanded: $expanded,
            sfSymbolName: "gearshape.fill"
        ) {
            Text("My content")
        }
    }
}
```

## Actions

You can add an action that's triggered when the button is expanded or collapsed using the built in controls.

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

When providing an action, you can choose not to provide content for the expanded state. This is useful if you want non-expanding buttons that match the style of expanding buttons.

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "bell.fill",
) {
    print("Button was pressed")
}
```

## Customization

### Icon

<!--TODO: Add Screenshot/GIF-->

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

Additionally, you can hide the icon altogether, or choose to hide the icon only for a specific state. When hiding the icon for the collapsed state, it's a good idea to show a title to prevent an empty button in collapsed state, though it is possible for the button to empty.

<!--TODO: Add side by side gifs here-->

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "bell.fill",
) {
    Text("Button with hidden icon")
}
.hideIcon(true)
.title("More Info")

CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "bell.fill",
) {
    Text("Button that hides icon only when expanded.")
}
.hideIcon(forState: .expanded)
```

### Title & Subtitle

The button provides options to show a title and subtitle. These can also be enabled only for specific states of the button.

<!--TODO: Add side by side gifs here-->

```Swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "envelope.fill",
) {
    Text("My content")
}
.title("Inbox")
.subtitle("5 unread messages")

CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "mappin",
) {
    Text("My content")
}
.title("Visit San Francisco", forState: .collapsed)
.title("San Francisco", forState: .expanded)
.subtitle("Top attractions", forState: .expanded)
```

### Header Only Options

There are additional customization options for customizing the header when the button is expanded. 

<table>
<tr>
<td> Hide Header </td> <td> Hide Seperator </td> <td> Hide Close Button </td>
</tr>

<tr>
<td> <!-- Add Screenshot--> </td> <td> <!-- Add Screenshot--> </td> <td> <!-- Add Screenshot--> </td>
</tr>

<tr>
<td>

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "envelope.fill",
) {
    Text("My content")
)
.hideHeader()
```

</td>
<td>

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "envelope.fill",
) {
    Text("My content")
)
.hideSeperator()
```

</td>
<td>

```swift
CUIExpandableButton(
    expanded: $expanded,
    sfSymbolName: "envelope.fill",
) {
    Text("My content")
)
.hideCloseButton()
```

</td>
</tr>
</table>

### Custom Color

<!--TODO: Add quip about background color-->

<!--TODO: Foreground color, rewrite sentance below, maybe make a list-->

### Other Feature

It is worth noting that CUIExpandableButton fully supports dynamic type variants, dark mode, and the right to left layout direction.

## Installation

CUIExpandableButton supports Swift Package Manager. To use it the following to your `Package.swift` file:

```
dependencies: [
    .package(name: "CUIExpandableButton", url: "https://github.com/robhasacamera/CUIExpandableButton.git", from: "0.9.0")
],
```

Support for CocoaPods and Carthage are being considered for future releases.

## Sample Project

A sample project, `ButtonDemo.xcodeproj`, can be found in the `SampleApp` folder.

## Future Plans

Below are some of the current limitations for CUIExpandableButton. These are being considered for future releases.
- Background corner radius customization when expanded
- Other backgrounds materials
