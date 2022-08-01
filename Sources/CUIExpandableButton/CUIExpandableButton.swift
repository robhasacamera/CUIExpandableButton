//
// CUIExpandableButton
//
// MIT License
//
// Copyright (c) 2022 Robert Cole
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import SwiftUI

/// A control that expands to display additional content and/or initiate an action.
///
/// The `CUIExpandableButton` is a prestyled button that when tapped, will
/// expand to display additional content. When collapsed, it is displayed as a 44 x
/// 44 tappable button. The button uses the `utlraThinMaterial`
/// background [defined by Apple](https://tinyurl.com/hbzvf74y ).
///
/// ### Icon options
///
/// There are two options available for the buttons icon, a custom icon and a SF
/// Symbol icon.
///
/// The custom option allows any view to be used for the icon. The icon can be any
/// size, but care should be given to ensure the icon isn't clipped by the rounded
/// corners of the button in collapsed or expanded more. The minimum size for the
/// button and icon area in the header will be maintained at 44x44. Icons that have
/// non-equal height and width, will transform the button into a pill shape instead of
/// a circle.
///
/// ```
/// CUIExpandableButton(
///     expanded: $expanded
/// ) {
///     Image("icon")
///         .resizable()
///         .aspectRatio(contentMode: .fit)
///         .frame(width: 26, height: 26)
/// } content: {
///     Text("My content")
/// }
///
/// ```
///
/// Using a SF Symbol for the icon is straightforward, simply provide the name of
/// the symbol to display the icon. This  guarantees a consistent experience for
/// things like dynamic type and will stay within the bounds of the collapsed
/// button's background.
///
/// ```
/// CUIExpandableButton(
///     expanded: $expanded,
///     sfSymbolName: "gearshape.fill"
/// ) {
///     VStack {
///         Toggle("Setting 1", isOn: $toggleBool1)
///         Toggle("Setting 2", isOn: $toggleBool2)
///         Toggle("Setting 3", isOn: $toggleBool3)
///     }
///     .frame(width: 200)
///     .padding(8)
/// }
///
/// ```
///
/// ### Styling the button
///
/// There are several options for styling the button, which include, it's color, font
/// weight, title, and header options (See ``CUIHeaderOptions``.
///
/// The color of the button's foreground elements can be changed using the
/// ``foregroundColor(_:)`` modifier. Similarly, the
/// ``fontWeight(_:)`` can be used to adjust the fontweight of the button's
/// icon and header elements.
///
/// The button provides an optional title that will be displayed next to the icon
/// when expanded and an otional subtitle that will be displayed below the title.
/// The close button can also be hidden. Hiding the close button means there
/// is no native control for hiding the content of the button once expanded.
///
/// ```
/// CUIExpandableButton(
///     expanded: $expanded,
///     sfSymbolName: "flame.fill",
///     title: "Hidden Close Button",
///     subtitle: "With custom color and fontweight"
///     headerOptions: .hideCloseButton
/// ) {
///     Text("You can customize the title, color, fontweight, and even hide the close button or other header elements.")
///        .frame(width: 200)
///        .padding(8)
/// }
/// .foregroundColor(.yellow)
/// .fontWeight(.bold)
///
/// ```
///
/// ### Additional action and non-expanding buttons
///
/// The button provides access to an additional action when tapped. This can be
/// used to perform another action when expanding or collapsing the button's
/// content. The button also supports not displaying content at all. This is provided
/// a consistent set of buttons when using expanding and non-expanding buttons
/// in the same UI.
///
/// ```
/// CUIExpandableButton(
///     expanded: $expanded,
///     sfSymbolName: "bell.fill",
/// ) {
///     Text("Additional actions can be performed when expanding/collpasing")
///         .frame(width: 200)
///         .padding(8)
/// } action: {
///     print("Button was pressed")
/// }
///
/// ```
///
/// ### Additional support
///
/// It is worth noting that this button fully supports dynamic type variants, dark
/// mode, and the right to left layout direction.
///
/// ### Other limitations
///
/// Below are the items that are not currently supported. Support maybe added in
/// the future.
/// - Hiding the header, separator, or the icon when expanded
/// - Collapsed button sizes other then 44 x 44
/// - Background corner radius customization when expanded
/// - Other button shapes
/// - Other backgrounds styles or materials
/// - Displaying a title/subtitle with the icon while collapsed
///
/// When expanded, the minimum width the button is 88. Any content displayed
/// smaller then this will be centered. in the content area.
public struct CUIExpandableButton<Icon, Content>: View where Icon: View, Content: View {
    @Namespace private var animation

    /// An action is a closure with no return type
    public typealias Action = () -> Void

    @ScaledMetric(relativeTo: .title)
    var minIconSize: CGFloat = .icon

    @State
    var iconSize = CGSize.zero

    var iconMinLength: CGFloat {
        min(iconSize.width, iconSize.height)
    }

    var headerHeight: CGFloat {
        if nonEmptyViewExpanded {
            if headerOptions.contains(.hideHeader) {
                return 0
            }

            return minIconSize + (headerOptions.contains(.hideSeparator) ? 0 : 1)
        }

        return iconMinLength
    }

    var showTitleSubtitleStack: Bool {
        (title != nil && !headerOptions.contains(.hideTitle))
        || (subtitle != nil && !headerOptions.contains(.hideSubtitle))
    }

    @ScaledMetric(relativeTo: .title)
    var menuCornerRadius: CGFloat = .menuCornerRadius

    @Binding var expanded: Bool

    let title: String?
    let subtitle: String?
    let headerOptions: CUIHeaderOptions
    let icon: Icon
    let content: Content
    let action: Action?

    private var nonEmptyViewExpanded: Bool {
        !(content is EmptyView) && expanded
    }

    // TODO: Document new param
    /// Creates an expandable button, using a custom icon.
    /// - Parameters:
    ///   - expanded: Bool binding that tracks the button's expanded state.
    ///   - title: String displayed in the header when expanded.
    ///   - subtitle: String displayed beneath the title in the header when expanded.
    ///   - headerOptions: Define the bahavior of the header. See
    ///   ``CUIHeaderOptions`` for more info.
    ///   - icon: View that is displayed as an icon. This view will be
    ///   constrained to a min width and height of 44 x 44.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    public init(
        expanded: Binding<Bool>,
        title: String? = nil,
        subtitle: String? = nil,
        hiddenCloseButton: Bool = false,
        headerOptions: CUIHeaderOptions = .none,
        @ViewBuilder icon: () -> Icon,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        _expanded = expanded
        self.title = title
        self.subtitle = subtitle
        self.headerOptions = headerOptions
        self.icon = icon()
        self.content = content()
        self.action = action
    }

    var iconView: some View {
        icon
            .frame(minWidth: minIconSize, minHeight: minIconSize)
            .fixedSize()
            .background(DEBUG_LAYOUT ? .green : .clear)
            .matchedGeometryEffect(id: "icon", in: animation)
    }

    var titleAndSubtitle: some View {
        VStack(alignment: .leading) {
            if let title = title, !headerOptions.contains(.hideTitle) {
                Text(title)
                    .font(.headline)
                    .background(DEBUG_LAYOUT ? .red : .clear)
            }
            if let subtitle = subtitle, !headerOptions.contains(.hideSubtitle) {
                Text(subtitle)
                    .font(.subheadline)
                    .background(DEBUG_LAYOUT ? .orange : .clear)
            }
        }
        .padding(.leading, headerOptions.contains(.hideIcon) ? .standardSpacing : 0)
        .padding(.trailing, headerOptions.contains(.hideCloseButton) ? .standardSpacing : 0)
        .padding(.bottom, headerOptions.contains([.hideIcon, .hideCloseButton]) ? .standardSpacing : 0)
        .matchedGeometryEffect(id: "titleAndSubtitle", in: animation)
    }

    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                // This animation looks delayed in previews, but works fine in the simulator
                if expanded {
                    if !headerOptions.contains(.hideIcon) {
                        ChildSizeReader(size: $iconSize) {
                            iconView
                        }
                    }
                } else {
                    ChildSizeReader(size: $iconSize) {
                        Button {
                            expanded.toggle()
                            action?()
                        } label: {
                            HStack(spacing: 0) {
                                iconView
                                if showTitleSubtitleStack {
                                    titleAndSubtitle
                                        .padding(.trailing, iconMinLength / 2)
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }

                if nonEmptyViewExpanded {
                    if showTitleSubtitleStack {
                        titleAndSubtitle
                    }

                    Spacer(minLength: 0)

                    if !headerOptions.contains(.hideCloseButton) {
                        CloseButton {
                            self.expanded.toggle()
                            self.action?()
                        }
                        .frame(
                            height:
                            headerOptions.contains(.hideIcon)
                                ? nil :
                                iconSize.height,
                            alignment: .top
                        )
                        .transition(.opacity)
                    }
                }
            }

            if nonEmptyViewExpanded && !headerOptions.contains(.hideSeparator) {
                Separator(style: .horizontal)
            }
        }
        .frame(
            minHeight: headerHeight
        )
        .frame(minWidth: nonEmptyViewExpanded && !headerOptions.contains(.hideHeader) ? minIconSize * 2 : nil)
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
            VStack(spacing: 0) {
                header
                    .frame(maxWidth: .infinity) // This may not be needed

                if nonEmptyViewExpanded {
                    content
                        .transition(.opacity)
                }
            }

            if DEBUG_LAYOUT {
                Text(String(format: "%.1f", iconSize.width))
                    .foregroundColor(.green)
                    .background(.gray)
            }
        }
        // FIXME: Material doesn't render in snapshot tests for some reason
        .background(isRunningUnitTests() ? .gray : .clear)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: nonEmptyViewExpanded ? menuCornerRadius : iconMinLength / 2))
        .animation(.spring(), value: expanded)
        .fixedSize()
    }
}

public extension CUIExpandableButton where Content == EmptyView {
    /// Creates a nonexpandabled button that iniates an action.
    /// - Parameters:
    ///   - icon: View that is displayed as an icon. This view will be
    ///   constrained to a min width and height of 44 x 44.
    ///   - action: Action that will be performed when tapping the button.
    init(
        @ViewBuilder icon: () -> Icon,
        action: @escaping Action
    ) {
        self.init(
            expanded: .constant(false),
            icon: icon,
            content: { EmptyView() },
            action: action
        )
    }
}

public extension CUIExpandableButton where Icon == SFSymbolIcon {
    // TODO: Document param
    /// Creates an expandable button, using a SF Symbol as the icon.
    /// - Parameters:
    ///   - expanded: Bool binding that tracks the button's expanded state.
    ///   - sfSymbolName: The name of the SF Symbol to use as the icon.
    ///   - title: String displayed in the header when expanded.
    ///   - subtitle: String displayed beneath the title in the header when expanded.
    ///   - headerOptions: Define the bahavior of the header. See
    ///   ``CUIHeaderOptions`` for more info.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    init(
        expanded: Binding<Bool>,
        sfSymbolName: String,
        title: String? = nil,
        subtitle: String? = nil,
        headerOptions: CUIHeaderOptions = .none,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        self.init(
            expanded: expanded,
            title: title,
            subtitle: subtitle,
            headerOptions: headerOptions,
            icon: { SFSymbolIcon(iconName: sfSymbolName) },
            content: content,
            action: action
        )
    }
}

public extension CUIExpandableButton where Icon == SFSymbolIcon, Content == EmptyView {
    /// Creates a nonexpandabled button that iniates an action.
    /// - Parameters:
    ///   - sfSymbolName: The name of the SF Symbol to use as the icon.
    ///   - action: Action that will be performed when tapping the button.
    init(
        sfSymbolName: String,
        action: @escaping Action
    ) {
        self.init(
            expanded: .constant(false),
            sfSymbolName: sfSymbolName,
            content: { EmptyView() },
            action: action
        )
    }
}

private let DEBUG_LAYOUT = false

struct CUIExpandableButton_PreviewWrapper: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    @State var collapsed2: Bool = false
    @State var expanded2: Bool = true

    @State var collapsed3: Bool = false
    @State var expanded3: Bool = true

    @State var collapsed4: Bool = false
    @State var expanded4: Bool = true

    @State var collapsed5: Bool = false
    @State var expanded5: Bool = true

    var body: some View {
        VStack {
            HStack {
                CUIExpandableButton(
                    expanded: $collapsed0,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    subtitle: "McFly"
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded0 = !collapsed0
                }
                .foregroundColor(.yellow)
                CUIExpandableButton(
                    expanded: $expanded0,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    subtitle: "McFly"
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed0 = !expanded0
                }
                .foregroundColor(.yellow)
            }

            HStack {
                CUIExpandableButton(
                    expanded: $collapsed1,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    subtitle: "McFly",
                    headerOptions: .hideIcon
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded1 = !collapsed1
                }
                CUIExpandableButton(
                    expanded: $expanded1,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    subtitle: "McFly",
                    headerOptions: .hideIcon
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed1 = !expanded1
                }
            }

            HStack {
                CUIExpandableButton(
                    expanded: $collapsed2,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: [.hideSeparator, .hideTitle]
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded2 = !collapsed2
                }
                CUIExpandableButton(
                    expanded: $expanded2,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: [.hideSeparator, .hideTitle]
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed2 = !expanded2
                }
            }

            HStack {
                CUIExpandableButton(
                    expanded: $collapsed3,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: .hideCloseButton
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded3 = !collapsed3
                }
                CUIExpandableButton(
                    expanded: $expanded3,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: .hideCloseButton
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed3 = !expanded3
                }
            }

            HStack {
                CUIExpandableButton(
                    expanded: $collapsed4,
                    title: "Marty"
                ) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 20, height: 100)
                        .padding(8)
                } content: {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded4 = !collapsed4
                }

                CUIExpandableButton(
                    expanded: $expanded4,
                    title: "Marty"
                ) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 100, height: 20)
                        .padding(8)
                } content: {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed4 = !expanded4
                }
            }

            HStack {
                CUIExpandableButton(
                    expanded: $collapsed5,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: .hideHeader
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    expanded5 = !collapsed5
                }
                CUIExpandableButton(
                    expanded: $expanded5,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty!",
                    headerOptions: .hideHeader
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                } action: {
                    collapsed5 = !expanded5
                }
            }
        }
        .animation(.default, value: expanded0)
        .animation(.default, value: collapsed0)
        .animation(.default, value: expanded1)
        .animation(.default, value: collapsed1)
        .animation(.default, value: expanded2)
        .animation(.default, value: collapsed2)
        .animation(.default, value: expanded3)
        .animation(.default, value: collapsed3)
        .animation(.default, value: expanded4)
        .animation(.default, value: collapsed4)
        .animation(.default, value: expanded5)
        .animation(.default, value: collapsed5)
    }
}

struct CUIExpandableButton_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview {
            HStack {
                CUIExpandableButton_PreviewWrapper()
            }
        }
    }
}

// From: https://stackoverflow.com/a/33194122/898984
private func isRunningUnitTests() -> Bool {
    if let _ = NSClassFromString("XCTest") {
        return true
    }

    return false
}
