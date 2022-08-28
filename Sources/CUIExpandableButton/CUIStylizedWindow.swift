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

public protocol CUIStylizedWindow: CUIStylizedControl {
    associatedtype Window: CUIStylizedWindow

    var hideHeader: Bool { get set }
    var hideSeparator: Bool { get set }
    var hideCloseButton: Bool { get set }

    /// Hides the separator displayed in the header when the button is expanded.
    /// - Parameter hideSeparator: Indicates whether to hide the separator (`true`) or show the separator (`false`).
    /// - Returns: Button that hides/shows the separator.
    func hideSeparator(
        _ hideSeparator: Bool
    ) -> Window

    /// Hides the close button displayed in the header when the button is expanded.
    /// - Parameter hideSeparator: Indicates whether to hide the close button (`true`) or show the close button (`false`).
    /// - Returns: Button that hides/shows the close button.
    func hideCloseButton(
        _ hideCloseButton: Bool
    ) -> Window

    /// Hides the header when the button is expanded.
    ///
    /// The header includes the icon, title, subtitle, close button, and separator.
    /// Hiding the header will hide the other header element regardless of their settings.
    /// - Parameter hideSeparator: Indicates whether to hide the header (`true`) or show the header (`false`).
    /// - Returns: Button that hides/shows the header.
    func hideHeader(
        _ hideHeader: Bool
    ) -> Window
}

public extension CUIStylizedWindow {
    func hideSeparator(
        _ hideSeparator: Bool = true
    ) -> Window {
        var newSelf = self

        newSelf.hideSeparator = hideSeparator

        return newSelf as! Self.Window
    }

    func hideCloseButton(
        _ hideCloseButton: Bool = true
    ) -> Window {
        var newSelf = self

        newSelf.hideCloseButton = hideCloseButton

        return newSelf as! Self.Window
    }

    func hideHeader(
        _ hideHeader: Bool = true
    ) -> Window {
        var newSelf = self

        newSelf.hideHeader = hideHeader

        return newSelf as! Self.Window
    }
}
