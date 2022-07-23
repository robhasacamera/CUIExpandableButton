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

/*
 TODO: Below
 x1. Add optional action for button touch
 x2. Make content into view builder
 x3. Make title optional
 x4. Make content optional, EmptyView as internal default.
 5. Add previews and tests for the new previews added.
 6. Add additional inits to make this cleaner?
 7. Remove expanded width
 8. Allow for other views for the icon. Will need to add another generic for this.
 */
public struct CrystalButton<Content>: View where Content: View {
    public init(
        expanded: Binding<Bool>,
        iconName: String,
        title: String? = nil,
        @ViewBuilder content: () -> Content,
        action: CrystalButton<Content>.Action? = nil
    ) {
        _expanded = expanded
        self.iconName = iconName
        self.title = title
        self.content = content()
        self.action = action
    }

    public typealias Action = () -> Void

    @Binding var expanded: Bool

    private var nonEmptyViewExpanded: Bool {
        !(content is EmptyView) && expanded
    }

    let iconName: String
    let title: String?
    let content: Content
    let action: Action?

    var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    // add action and pass in expansion state to it.
                    expanded.toggle()
                    action?()
                } label: {
                    SFSymbolIcon(iconName: iconName)
                }
                .disabled(nonEmptyViewExpanded)

                if nonEmptyViewExpanded {
                    HStack(spacing: 0) {
                        if let title {
                            Title(text: title)
                        }

                        Spacer()

                        CloseButton {
                            self.expanded.toggle()
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
        .frame(width: nonEmptyViewExpanded ? nil : SFSymbolIcon.size.height, height: SFSymbolIcon.size.height + (expanded ? 1 : 0))
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
            VStack(spacing: 0) {
                header
                    .frame(maxWidth: .infinity)

                if nonEmptyViewExpanded {
                    content
                        .transition(.opacity)

                    Spacer()
                }
            }
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: nonEmptyViewExpanded ? .menuCornerRadius : .icon / 2))
        .animation(.spring(), value: expanded)
        .fixedSize()
    }
}

public extension CrystalButton where Content == EmptyView {
    init(
        expanded: Binding<Bool>,
        iconName: String,
        title: String? = nil,
        action: CrystalButton<Content>.Action? = nil
    ) {
        _expanded = expanded
        self.iconName = iconName
        self.title = title
        self.content = EmptyView()
        self.action = action
    }
}

struct CrystalButton_PreviewWrapper: View {
    @State var expanded: Bool
    var title: String?

    var body: some View {
        CrystalButton(
            expanded: $expanded,
            iconName: "questionmark",
            title: title
        ) {
            Text(LoremIpsum.paragraphs(1))
                .font(.system(size: 18.0))
                .padding(.standardSpacing)
                .frame(width: 300)
                .foregroundColor(.cystalForegroundDefault)
        }
        action: {} // Need to make an init to fix this
    }
}

struct CrystalButton_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview(content: CrystalButton_PreviewWrapper(expanded: true, title: nil))

        CenteredPreview(content: CrystalButton_PreviewWrapper(expanded: false, title: "Information"))
    }
}
