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

import CUIPreviewKit
import SwiftUI

public struct CUIButton<Icon>: _CUIStylizedControl where Icon: View {
    public typealias Control = CUIExpandableButton<Icon, EmptyView>
    
    public typealias Action = CUIExpandableButton<Icon, EmptyView>.Action

    var button: CUIExpandableButton<Icon, EmptyView>

    /// Creates a stylized button that initiates an action.
    /// - Parameters:
    ///   - icon: View that is displayed as an icon.
    ///   - action: Action that will be performed when tapping the button.
    public init(
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

    public var body: some View {
        button
    }
}

public extension CUIButton where Icon == SFSymbolIcon {
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
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(
                                width: 10,
                                height: 10
                            )
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
