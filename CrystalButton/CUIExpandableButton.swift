//
//  CrystalButton.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
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
/// The custom option allows any view to be used for the icon. The frame of a
/// custom icon will be limited to a max width and height of 44 x 44. When using a
/// custom icon, it is recommended to keep the main body of the icon within a
/// size 26 x 26, to avoid extending outside the button's background.
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
/// weight, title, and close button.
///
/// The color of the button's foreground elements can be changed using the
/// ``foregroundColor(_:)`` modifier. Similarly, the
/// ``fontWeight(_:)`` can be used to adjust the fontweight of the button's
/// icon and header elements.
///
/// The button provides an optional title that will be displayed next to the icon
/// when expanded. The close button can also be hidden. Hiding the close button
/// means there is no native control for hiding the content of the button once
/// expanded.
///
/// ```
/// CUIExpandableButton(
///     expanded: $expanded,
///     sfSymbolName: "flame.fill",
///     title: "Hidden Close Button",
///     hiddenCloseButton: true
/// ) {
///     Text("You can customize the title, color, fontweight, and even hide the close button.")
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
///     title: "Custom Color"
/// ) {
///     Text("Additional actions can be performed when expanding/collpasing")
///         .frame(width: 200)
///         .padding(.standardSpacing)
/// } action: {
///     print("Button was pressed")
/// }
///
/// ```
///
/// ### Additional support
///
/// It is worth noting that the button fully supports dynamic type variants and dark
/// mode.
///
/// ### Other limitations
///
/// Below are the items that are not currently supported. Support maybe added in
/// the future.
/// - Right to left layout for the header
/// - Hiding the header, separator, or the icon when expanded
/// - Collapsed button sizes other then 44 x 44
/// - Background corner radius customization when expanded
/// - Other button shapes
/// - Other backgrounds styles or materials
///
/// When expanded, the minimum width the button is 88. Any content displayed
/// smaller then this will be centered. in the content area.
public struct CUIExpandableButton<Icon, Content>: View where Icon: View, Content: View {
    @Namespace private var animation

    @ScaledMetric(relativeTo: .title)
    var iconSize: CGFloat = .icon

    @ScaledMetric(relativeTo: .title)
    var menuCornerRadius: CGFloat = .menuCornerRadius

    /// An action is a closure with no return type
    public typealias Action = () -> Void

    @Binding var expanded: Bool

    let title: String?
    let hiddenCloseButton: Bool
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
    ///   - hiddenCloseButton: When `true`, the close button will be
    ///   hidden in the header.
    ///   - icon: View that is displayed as an icon. This view will be
    ///   constrained to a max width and height of 44 x 44.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    public init(
        expanded: Binding<Bool>,
        title: String? = nil,
        hiddenCloseButton: Bool = false,
        @ViewBuilder icon: () -> Icon,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        _expanded = expanded
        self.title = title
        self.hiddenCloseButton = hiddenCloseButton
        self.icon = icon()
        self.content = content()
        self.action = action
    }

    var iconView: some View {
        icon
            .frame(maxWidth: iconSize, maxHeight: iconSize)
            .matchedGeometryEffect(id: "icon", in: animation)
    }

    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                // This animation looks delayed in previews, but works fine in the simulator
                if expanded {
                    iconView
                } else {
                    Button {
                        // add action and pass in expansion state to it.
                        expanded.toggle()
                        action?()
                    } label: {
                        iconView
                    }
                    .buttonStyle(.plain)
                }

                if nonEmptyViewExpanded {
                    HStack(spacing: 0) {
                        if let title {
                            Text(title)
                                .font(.headline)
                        }

                        Spacer(minLength: 0)

                        if !hiddenCloseButton {
                            CloseButton {
                                self.expanded.toggle()
                            }
                        }
                    }
                    .transition(.opacity)
                }

                Spacer(minLength: 0)
            }

            if nonEmptyViewExpanded {
                Separator(style: .horizontal)
            }
        }
        .frame(width: nonEmptyViewExpanded ? nil : iconSize, height: iconSize + (nonEmptyViewExpanded ? 1 : 0))
        .frame(minWidth: nonEmptyViewExpanded ? iconSize * 2 : nil)
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
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: nonEmptyViewExpanded ? menuCornerRadius : .infinity))
        .animation(.spring(), value: expanded)
        .fixedSize()
    }
}

public extension CUIExpandableButton where Content == EmptyView {
    /// Creates a nonexpandabled button that iniates an action.
    /// - Parameters:
    ///   - icon: View that is displayed as an icon. This view will be
    ///   constrained to a max width and height of 44 x 44.
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
    /// Creates an expandable button, using a SF Symbol as the icon.
    /// - Parameters:
    ///   - expanded: Bool binding that tracks the button's expanded state.
    ///   - sfSymbolName: The name of the SF Symbol to use as the icon.
    ///   - title: String displayed in the header when expanded.
    ///   - hiddenCloseButton: When `true`, the close button will be
    ///   hidden in the header.
    ///   - content: The content that will be displayed when the button is expanded.
    ///   - action: Action that will be performed when the button is
    ///   collapsed or expanded using the built in controls.
    init(
        expanded: Binding<Bool>,
        sfSymbolName: String,
        title: String? = nil,
        hiddenCloseButton: Bool = false,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        self.init(
            expanded: expanded,
            title: title,
            hiddenCloseButton: hiddenCloseButton,
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

struct CUIExpandableButton_PreviewWrapper: View {
    @State var expanded: Bool
    var title: String?

    var body: some View {
        CUIExpandableButton(
            expanded: $expanded,
            sfSymbolName: "questionmark",
            title: title
        ) {
            Text(LoremIpsum.words(8))
                .font(.body)
                .padding(.standardSpacing)
                .frame(width: 200)
        }
    }
}

struct CUIExpandableButton_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview {
            HStack {
                CUIExpandableButton_PreviewWrapper(expanded: false, title: "Some Title")
                CUIExpandableButton_PreviewWrapper(expanded: true, title: nil)
            }
        }
    }
}
