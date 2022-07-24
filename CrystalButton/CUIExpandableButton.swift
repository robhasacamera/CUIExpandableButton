//
//  CrystalButton.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

extension CGFloat {
    static let standardSpacing: CGFloat = 8
    static let menuCornerRadius: CGFloat = 10
    static let icon: CGFloat = 44
}

public struct CUIExpandableButton<Icon, Content>: View where Icon: View, Content: View {
    @ScaledMetric(relativeTo: .title)
    var iconSize: CGFloat = .icon

    @ScaledMetric(relativeTo: .title)
    var menuCornerRadius: CGFloat = .menuCornerRadius

    public init(
        expanded: Binding<Bool>,
        title: String? = nil,
        hideCloseButton: Bool = false,
        @ViewBuilder icon: () -> Icon,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        _expanded = expanded
        self.title = title
        self.hideCloseButton = hideCloseButton
        self.icon = icon()
        self.content = content()
        self.action = action
    }

    public typealias Action = () -> Void

    @Binding var expanded: Bool

    private var nonEmptyViewExpanded: Bool {
        !(content is EmptyView) && expanded
    }

    let title: String?
    let hideCloseButton: Bool
    let icon: Icon
    let content: Content
    let action: Action?

    @Namespace private var animation

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

                        if !hideCloseButton {
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
    init(
        title: String? = nil,
        hideCloseButton: Bool = false,
        @ViewBuilder icon: () -> Icon,
        action: @escaping Action
    ) {
        self.init(
            expanded: .constant(false),
            title: title,
            hideCloseButton: hideCloseButton,
            icon: icon,
            content: { EmptyView() },
            action: action
        )
    }
}

public extension CUIExpandableButton where Icon == SFSymbolIcon {
    init(
        expanded: Binding<Bool>,
        sfSymbolName: String,
        title: String? = nil,
        hideCloseButton: Bool = false,
        @ViewBuilder content: () -> Content,
        action: Action? = nil
    ) {
        self.init(
            expanded: expanded,
            title: title,
            hideCloseButton: hideCloseButton,
            icon: { SFSymbolIcon(iconName: sfSymbolName) },
            content: content,
            action: action
        )
    }
}

public extension CUIExpandableButton where Icon == SFSymbolIcon, Content == EmptyView {
    init(
        sfSymbolName: String,
        title: String? = nil,
        hideCloseButton: Bool = false,
        action: @escaping Action
    ) {
        self.init(
            expanded: .constant(false),
            sfSymbolName: sfSymbolName,
            title: title,
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
