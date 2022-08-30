//
//  SwiftUIView.swift
//
//
//  Created by Robert Cole on 8/28/22.
//

import CUIPreviewKit
import SwiftUI

struct CUIButton<Icon>: View where Icon: View {
    typealias Action = CUIExpandableButton<Icon, EmptyView>.Action

    var button: CUIExpandableButton<Icon, EmptyView>

    /// Creates a stylized button that initiates an action.
    /// - Parameters:
    ///   - icon: View that is displayed as an icon.
    ///   - action: Action that will be performed when tapping the button.
    init(
        @ViewBuilder icon: () -> Icon,
        action: @escaping Action
    ) {
        button = CUIExpandableButton(
            expanded: .constant(false),
            icon: icon,
            content: {
                EmptyView()
            },
            action: action
        )
    }

    var body: some View {
        button
    }
}

extension CUIButton where Icon == SFSymbolIcon {
    /// Creates a stylized button that iniates an action.
    /// - Parameters:
    ///   - sfSymbolName: The name of the SF Symbol to use as the icon.
    ///   - action: Action that will be performed when tapping the button.
    init(
        sfSymbolName: String,
        action: @escaping Action
    ) {
        button = CUIExpandableButton(expanded: .constant(false), sfSymbolName: sfSymbolName, content: {
            EmptyView()
        }, action: action)
    }

    var body: some View {
        button
    }
}

struct CUIButton_Previews: PreviewProvider {
    static var previews: some View {
        CUICenteredPreview(title: "CUIButton") {
            VStack {
                CUICaptionedView("Custom Icon") {
                    CUIButton {
                        Text("Button Text")
                            .padding()
                    } action: {
                        print("button pressed")
                    }
                }
                CUICaptionedView("SF Symbol Icon") {
                    CUIButton(sfSymbolName: "doc.fill") {
                        print("button pressed")
                    }
                }
            }
        }
    }
}
