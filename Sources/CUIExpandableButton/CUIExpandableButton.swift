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
///
/// CUIExpandableButton(
///     expanded: $expanded,
///     sfSymbolName: "flame.fill",
///     title: "Hidden Close Button",
///     subtitle: "With custom color and fontweight"
///     options: CUIExpandeableButtonOptions(
///     expanded: .hideCloseButton,
///     collapsed: .showTitle
///     )
/// ) {
///     Text("You can customize the title, color, fontweight, and even hide the close button or other header elements.")
///     .frame(width: 200)
///     .padding(8)
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
/// - Background corner radius customization when expanded
/// - Other button shapes
/// - Other backgrounds styles or materials
///
/// When expanded, the minimum width the button is 88. Any content displayed
/// smaller then this will be centered. in the content area.
public struct CUIExpandableButton<Icon, Content>: View where Icon: View, Content: View {
    @Namespace private var animation

    // Needs to be a state so it will be preserved throughout the button's lifecycle
    @State
    var id = UUID()

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
            if options.expandedOptions.contains(.hideHeader) {
                return 0
            }

            return minIconSize + (options.expandedOptions.contains(.hideSeparator) ? 0 : 1)
        }

        return iconMinLength
    }

    var showTitleSubtitleStack: Bool {
        showTitle || showSubtitle
    }

    var showTitle: Bool {
        guard let title = title, !title.isEmpty else {
            return false
        }

        return (expanded && !options.expandedOptions.contains(.hideTitle))
            || (!expanded && options.collapsedOptions.contains(.showTitle))
    }

    var showSubtitle: Bool {
        guard let subtitle = subtitle, !subtitle.isEmpty else {
            return false
        }

        return (expanded && !options.expandedOptions.contains(.hideSubtitle))
            || (!expanded && options.collapsedOptions.contains(.showSubtitle))
    }

    @ScaledMetric(relativeTo: .title)
    var menuCornerRadius: CGFloat = .menuCornerRadius

    @Binding var expanded: Bool

    let title: String?
    let subtitle: String?
    let options: CUIExpandableButtonOptions
    let icon: Icon
    let content: Content
    let action: Action?

    private var nonEmptyViewExpanded: Bool {
        !(content is EmptyView) && expanded
    }

    /// Creates an expandable button, using a custom icon.
    /// - Parameters:
    ///   - expanded: Bool binding that tracks the button's expanded state.
    ///   - title: String displayed in the header when expanded.
    ///   - subtitle: String displayed beneath the title in the header when expanded.
    ///   - options: Options that customize the expandable button. See
    ///   ``CUIExpandableButtonOptions`` for details.
    ///   - icon: View that is displayed as an icon. This view will be
    ///   constrained to a min width and height of 44 x 44.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    public init(
        expanded: Binding<Bool>,
        title: String? = nil,
        subtitle: String? = nil,
        options: CUIExpandableButtonOptions = .standard,
        @ViewBuilder icon: () -> Icon,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        _expanded = expanded
        self.title = title
        self.subtitle = subtitle
        self.options = options
        self.icon = icon()
        self.content = content()
        self.action = action
    }

    var iconView: some View {
        icon
            .frame(minWidth: minIconSize, minHeight: minIconSize)
            .fixedSize()
            .background(DEBUG_LAYOUT ? .green.tint : .clear)
            .matchedGeometryEffect(id: "icon", in: animation)
    }

    var titleAndSubtitle: some View {
        VStack(alignment: .leading) {
            if let title = title, showTitle {
                Text(title)
                    .font(options.titleFont ?? .headline)
                    .background(DEBUG_LAYOUT ? .red.tint : .clear)
                    .matchedGeometryEffect(id: "title", in: animation)
            }
            if let subtitle = subtitle, showSubtitle {
                Text(subtitle)
                    .font(options.subtitleFont ?? .subheadline)
                    .background(DEBUG_LAYOUT ? .orange.tint : .clear)
                    .matchedGeometryEffect(id: "subtitle", in: animation)
            }
        }
        .padding(
            .leading,
            options.expandedOptions.contains(.hideIcon)
                && expanded
                ? .standardSpacing : 0
        )
        .padding(
            .trailing,
            options.expandedOptions.contains(.hideCloseButton)
                && expanded
                ? .standardSpacing : 0
        )
        .padding(
            .bottom,
            options.expandedOptions.contains([.hideIcon, .hideCloseButton])
                && expanded
                ? .standardSpacing : 0
        )
        .fixedSize()
    }

    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                // This animation looks delayed in previews, but works fine in the simulator
                if expanded {
                    if !options.expandedOptions.contains(.hideIcon) {
                        ChildSizeReader(
                            size: $iconSize,
                            id: id
                        ) {
                            iconView
                        }
                    }
                } else {
                    ChildSizeReader(
                        size: $iconSize,
                        id: id
                    ) {
                        Button {
                            expanded.toggle()
                            action?()
                        } label: {
                            HStack(spacing: 0) {
                                if !options.collapsedOptions.contains(.hideIcon) {
                                    iconView
                                }

                                /*
                                 * This is to make sure the button is still clickable
                                 * when the icon is hidden and neither the title or
                                 * the subtitle is being shown.
                                 */
                                if options.collapsedOptions.contains(.hideIcon)
                                    && !options.collapsedOptions.contains(.showTitle)
                                    && !options.collapsedOptions.contains(.showSubtitle)
                                {
                                    Color.white.opacity(0.01)
                                }

                                if showTitleSubtitleStack {
                                    titleAndSubtitle
                                        .padding(
                                            options.collapsedOptions.contains(.hideIcon)
                                                ? .horizontal
                                                : .trailing
                                        )
                                        .background(DEBUG_LAYOUT ? .purple.tint : .clear)
                                }
                            }
                            .frame(minWidth: minIconSize, minHeight: minIconSize)
                        }.buttonStyle(.plain)
                    }
                }

                if nonEmptyViewExpanded {
                    if showTitleSubtitleStack {
                        titleAndSubtitle
                            .background(DEBUG_LAYOUT ? .purple.tint : .clear)
                    }

                    Spacer(minLength: 0)

                    if !options.expandedOptions.contains(.hideCloseButton) {
                        CloseButton {
                            self.expanded.toggle()
                            self.action?()
                        }
                        .frame(
                            height:
                            options.expandedOptions.contains(.hideIcon)
                                ? nil :
                                iconSize.height,
                            alignment: .top
                        )
                        .transition(.opacity)
                    }
                }
            }

            if nonEmptyViewExpanded && !options.expandedOptions.contains(.hideSeparator) {
                Separator(style: .horizontal)
            }
        }
        .frame(
            minHeight: headerHeight
        )
        .frame(minWidth: nonEmptyViewExpanded && !options.expandedOptions.contains(.hideHeader) ? minIconSize * 2 : nil)
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
                    .background(.black.tint)
            }
        }
        // FIXME: Material doesn't render in snapshot tests for some reason
        .background(
            options.backgroundColor ?? (
                isRunningUnitTests()
                    ? .gray
                    : .clear
            )
        )
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
    ///   - options: Options that customize the expandable button. See
    ///   ``CUIExpandableButtonOptions`` for details.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    init(
        expanded: Binding<Bool>,
        sfSymbolName: String,
        title: String? = nil,
        subtitle: String? = nil,
        options: CUIExpandableButtonOptions = .standard,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        self.init(
            expanded: expanded,
            title: title,
            subtitle: subtitle,
            options: options,
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

// MARK: DEBUG_LAYOUT

internal let DEBUG_LAYOUT = false

private extension Color {
    var tint: Color {
        opacity(0.5)
    }
}

private struct Caption: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.bottom)
    }
}

struct CUIExpandableButtonPreview_CollapsedOptions: View {
    @State var collapsed0: Bool = false
    @State var collapsed1: Bool = false
    @State var collapsed2: Bool = false
    @State var collapsed3: Bool = false
    @State var collapsed4: Bool = false
    @State var collapsed5: Bool = false

    var body: some View {
        CenteredPreview(title: "Collapsed Options") {
            VStack {
                Group {
                    CUIExpandableButton(
                        expanded: $collapsed0,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: .none
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                    }
                    Caption(text: ".none")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $collapsed1,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: .showTitleAndSubtitle
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                    }
                    Caption(text: ".showTitleAndSubtitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $collapsed2,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: .showTitle
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                    }
                    Caption(text: ".showTitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $collapsed3,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: .showSubtitle
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed4 = false
                        collapsed5 = false
                    }
                    Caption(text: ".showSubtitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $collapsed4,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: .hideIcon
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed5 = false
                    }
                    Caption(text: ".hideIcon")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $collapsed5,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            collapsedOptions: [.hideIcon, .showTitleAndSubtitle]
                        )
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                    }
                    Caption(text: "[.hideIcon, .showTitleAndSubtitle]")
                }
            }
            .animation(.default, value: collapsed0)
            .animation(.default, value: collapsed1)
            .animation(.default, value: collapsed2)
            .animation(.default, value: collapsed3)
            .animation(.default, value: collapsed4)
            .animation(.default, value: collapsed5)
        }
    }
}

struct CUIExpandableButtonPreview_ExpandedOptions: View {
    @State var expanded0: Bool = false
    @State var expanded1: Bool = true
    @State var expanded2: Bool = true
    @State var expanded3: Bool = true
    @State var expanded4: Bool = true
    @State var expanded5: Bool = true
    @State var expanded6: Bool = true

    var body: some View {
        CenteredPreview(title: "Expanded Options") {
            VStack {
                Group {
                    CUIExpandableButton(
                        expanded: $expanded0,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .none
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    Caption(text: ".none")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded1,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideIcon
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    Caption(text: ".hideIcon")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded2,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideTitle
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    Caption(text: ".hideTitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded3,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideSubtitle
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    Caption(text: ".hideSubtitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded4,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideTitleAndSubtitle
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    Caption(text: ".hideTitleAndSubtitle")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded5,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideCloseButton
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded6 = false
                    }
                    Caption(text: ".hideCloseButton")
                }

                Group {
                    CUIExpandableButton(
                        expanded: $expanded6,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly",
                        options: CUIExpandableButtonOptions(
                            expandedOptions: .hideHeader
                        )
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                    }
                    Caption(text: ".hideHeader")
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: expanded1)
            .animation(.default, value: expanded2)
            .animation(.default, value: expanded3)
            .animation(.default, value: expanded4)
            .animation(.default, value: expanded5)
            .animation(.default, value: expanded6)
        }
    }
}

struct CUIExpandableButtonPreview_OtherOptions: View {
    @State var expanded0: Bool = true
    @State var expanded1: Bool = true
    @State var expanded2: Bool = true

    var body: some View {
        CenteredPreview(title: "Other Options") {
            VStack {
                CUIExpandableButton(
                    expanded: $expanded0,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty",
                    subtitle: "McFly",
                    options: CUIExpandableButtonOptions(
                        titleFont: .title
                    )
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                }
                Caption(text: "titleFont: .title")

                CUIExpandableButton(
                    expanded: $expanded1,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty",
                    subtitle: "McFly",
                    options: CUIExpandableButtonOptions(
                        subtitleFont: .caption
                    )
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                }
                Caption(text: "subtitleFont: .caption")

                CUIExpandableButton(
                    expanded: $expanded2,
                    sfSymbolName: "gearshape.fill",
                    title: "Marty",
                    subtitle: "McFly",
                    options: CUIExpandableButtonOptions(
                        backgroundColor: .cyan.opacity(0.5)
                    )
                ) {
                    Text(LoremIpsum.words(8))
                        .font(.body)
                        .padding(.standardSpacing)
                        .frame(width: 200)
                }
                Caption(text: "backgroundColor: .cyan.opacity(0.5)")
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: expanded1)
            .animation(.default, value: expanded2)
        }
    }
}

struct CUIExpandableButtonPreview_CustomIcons: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    @State var collapsed2: Bool = false
    @State var expanded2: Bool = true

    @State var collapsed3: Bool = false
    @State var expanded3: Bool = true

    var smallIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 20, height: 20)
            .padding(8)
    }

    var wideIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 100, height: 20)
            .padding(8)
    }

    var tallIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 20, height: 100)
            .padding(8)
    }

    var largeIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 100, height: 100)
            .padding(8)
    }

    var body: some View {
        CenteredPreview(title: "Custom Icons") {
            VStack {
                HStack {
                    CUIExpandableButton(
                        expanded: $collapsed0,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        smallIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded0 = !collapsed0
                    }

                    CUIExpandableButton(
                        expanded: $expanded0,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        smallIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed0 = !expanded0
                    }
                }
                Caption(text: "smallIcon")

                HStack {
                    CUIExpandableButton(
                        expanded: $collapsed1,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        wideIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded1 = !collapsed1
                    }

                    CUIExpandableButton(
                        expanded: $expanded1,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        wideIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed1 = !expanded1
                    }
                }
                Caption(text: "wideIcon")

                HStack {
                    CUIExpandableButton(
                        expanded: $collapsed2,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        tallIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded2 = !collapsed2
                    }

                    CUIExpandableButton(
                        expanded: $expanded2,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        tallIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed2 = !expanded2
                    }
                }
                Caption(text: "tallIcon")

                HStack {
                    CUIExpandableButton(
                        expanded: $collapsed3,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        largeIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        expanded3 = !collapsed3
                    }

                    CUIExpandableButton(
                        expanded: $expanded3,
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        largeIcon
                    } content: {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    } action: {
                        collapsed3 = !expanded3
                    }
                }
                Caption(text: "largeIcon")
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
            .animation(.default, value: expanded2)
            .animation(.default, value: collapsed2)
            .animation(.default, value: expanded3)
            .animation(.default, value: collapsed3)
        }
    }
}

struct CUIExpandableButtonPreview_Modifiers: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    var body: some View {
        CenteredPreview(title: "Modifiers") {
            VStack {
                HStack {
                    CUIExpandableButton(
                        expanded: $collapsed0,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                            .foregroundColor(nil)
                    } action: {
                        expanded0 = !collapsed0
                    }
                    .foregroundColor(.yellow)

                    CUIExpandableButton(
                        expanded: $expanded0,
                        sfSymbolName: "gearshape.fill",
                        title: "Marty",
                        subtitle: "McFly"
                    ) {
                        Text(LoremIpsum.words(2))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                            .foregroundColor(nil)
                    } action: {
                        collapsed0 = !expanded0
                    }
                    .foregroundColor(.yellow)
                }
                Caption(text: ".foregroundColor(.yellow)")

                #if swift(>=5.7)
                    if #available(iOS 16.0, *) {
                        HStack {
                            CUIExpandableButton(
                                expanded: $collapsed1,
                                sfSymbolName: "gearshape.fill",
                                title: "Marty",
                                subtitle: "McFly"
                            ) {
                                Text(LoremIpsum.words(2))
                                    .font(.body)
                                    .padding(.standardSpacing)
                                    .frame(width: 200)
                                    .fontWeight(nil)
                            } action: {
                                expanded1 = !collapsed1
                            }
                            .fontWeight(.bold)

                            CUIExpandableButton(
                                expanded: $expanded1,
                                sfSymbolName: "gearshape.fill",
                                title: "Marty",
                                subtitle: "McFly"
                            ) {
                                Text(LoremIpsum.words(2))
                                    .font(.body)
                                    .padding(.standardSpacing)
                                    .fontWeight(nil)
                            } action: {
                                collapsed1 = !expanded1
                            }
                            .fontWeight(.bold)
                        }
                        Caption(text: ".fontWeight(.bold)")
                    }
                #endif
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
        }
    }
}

struct CUIExpandableButton_Previews: PreviewProvider {
    static var previews: some View {
        CUIExpandableButtonPreview_CollapsedOptions()

        CUIExpandableButtonPreview_ExpandedOptions()

        CUIExpandableButtonPreview_OtherOptions()

        CUIExpandableButtonPreview_CustomIcons()

        CUIExpandableButtonPreview_Modifiers()
    }
}

// From: https://stackoverflow.com/a/33194122/898984
private func isRunningUnitTests() -> Bool {
    if let _ = NSClassFromString("XCTest") {
        return true
    }

    return false
}
