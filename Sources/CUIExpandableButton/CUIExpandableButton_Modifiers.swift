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

public extension CUIExpandableButton {
    /// Sets up the expandable button using the standard layout. This includes:
    /// - Showing the title/subtitle only when expanded.
    /// - Showing only the icon when collapsed.
    /// - Showing all header elements when expanded.
    /// - Showing the default background.
    ///
    /// Note that setting this will reset all other modifiers.
    /// - Parameters:
    ///   - title: Title to display when expanded.
    ///   - subtitle: Subtitle to display when expanded.
    /// - Returns: Button that uses the standard layout.
    func standardLayout(
        title: String?,
        subtitle: String?
    ) -> CUIExpandableButton {
        self
            .title(title, forState: .expanded)
            .title(nil, forState: .collapsed)
            .subtitle(subtitle, forState: .expanded)
            .subtitle(nil, forState: .collapsed)
            .backgroundColor(nil)
            .hideBackground(false)
            .hideIcon(false)
            .hideSeparator(false)
            .hideCloseButton(false)
            .hideHeader(false)
            .backgroundMaterial(.ultraThinMaterial)
            .buttonCornerRadius(nil)
    }

    /// Sets the title to display for the button.
    ///
    /// The title can be set for the expanded state, collapsed state, or both.
    /// A value of `nil` will hide the title for that state.
    /// - Parameters:
    ///   - title: The title to display for the provided state.
    ///   - font: The font to display the title with for the given state.
    ///   - state: The state to display the provided title in.
    /// - Returns: Button that displays the provided title in the provided state.
    func title(
        _ title: String?,
        font: Font? = nil,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._title.setValue(title, forState: state)
        newSelf._titleFont.setValue(font, forState: state)

        return newSelf
    }

    /// Sets the subtitle to display for the button.
    ///
    /// The subtitle can be set for the expanded state, collapsed state, or both.
    /// A value of `nil` will hide the subtitle for that state.
    /// - Parameters:
    ///   - subtitle: The subtitle to display for the provided state.
    ///   - font: The font to display the subtitle with for the given state.
    ///   - state: The state to display the provided subtitle in.
    /// - Returns: Button that displays the provided subtitle in the provided state.
    func subtitle(
        _ subtitle: String?,
        font: Font? = nil,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._subtitle.setValue(subtitle, forState: state)
        newSelf._subtitleFont.setValue(font, forState: state)

        return newSelf
    }

    /// Sets the background color for the button.
    ///
    /// When setting this to a non-nil value, the material background is still
    /// rendered underneath. A transparent color will show the material
    /// background underneath.
    /// - Parameters:
    ///   - color: The color for the background.
    ///   - state: The state to display the provided background color.
    /// - Returns: Button that displays the provided background color.
    func backgroundColor(
        _ color: Color?,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._backgroundColor.setValue(color, forState: state)

        return newSelf
    }

    // TODO: Add option for which background to hide? Color, material, all?
    /// Hides the background for the button.
    ///
    /// This function accepts a `Bool` to allow hiding the background to be
    /// toggled.
    /// - Parameters:
    ///   - hideBackground: Indicates whether to hide the background
    ///   (`true`) or show the background (`false`).
    ///   - state: The state to hide/show the background in.
    /// - Returns: Button that hides/shows the background in the provided state.
    func hideBackground(
        _ hideBackground: Bool = true,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._hideBackground.setValue(hideBackground, forState: state)

        return newSelf
    }

    /// Hides the icon for the button.
    ///
    /// This function accepts a `Bool` to allow hiding the icon to be toggled.
    /// - Parameters:
    ///   - hideIcon: Indicates whether to hide the icon (`true`) or show the icon (`false`).
    ///   - state: The state to hide/show the background in.
    /// - Returns: Button that hides/shows the icon in the provided state.
    func hideIcon(
        _ hideIcon: Bool = true,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._hideIcon.setValue(hideIcon, forState: state)

        return newSelf
    }

    /// Sets the corner radius of the button when collapsed/expanded.
    ///
    /// When collapsed, the max value is always capped at width / 2.0. Unless the height is less than
    /// the width, in which case it's max value is height / 2.0. Any value greater than this will be ignored.
    /// - Parameters:
    ///   - radius: The radius for the corners of the button. A value of `nil` will use the default value instead.
    ///   - state: The state to use the provided corner radius.
    /// - Returns: Button that has corners rounded at the provided radius.
    func buttonCornerRadius(
        _ radius: CGFloat?,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._cornerRadius.setValue(radius, forState: state)

        return newSelf
    }

    /// Sets the material of the background of the button.
    ///
    /// A nil value will hide the material background altogether, however background color will still be applied.
    /// - Parameters:
    ///   - material: The material to use for the background
    ///   - state: The state to use the provided material.
    /// - Returns: Button that has a background using the material provided.
    func backgroundMaterial(
        _ material: Material?,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._backgroundMaterial.setValue(material, forState: state)

        return newSelf
    }

    /// Hides the separator displayed in the header when the button is expanded.
    /// - Parameter hideSeparator: Indicates whether to hide the separator (`true`) or show the separator (`false`).
    /// - Returns: Button that hides/shows the separator.
    func hideSeparator(_ hideSeparator: Bool = true) -> CUIExpandableButton {
        var newSelf = self

        newSelf._hideSeparator = hideSeparator

        return newSelf
    }

    /// Hides the close button displayed in the header when the button is expanded.
    /// - Parameter hideSeparator: Indicates whether to hide the close button (`true`) or show the close button (`false`).
    /// - Returns: Button that hides/shows the close button.
    func hideCloseButton(_ hideCloseButton: Bool = true) -> CUIExpandableButton {
        var newSelf = self

        newSelf._hideCloseButton = hideCloseButton

        return newSelf
    }

    /// Hides the header when the button is expanded.
    ///
    /// The header includes the icon, title, subtitle, close button, and separator.
    /// Hiding the header will hide the other header element regardless of their settings.
    /// - Parameter hideSeparator: Indicates whether to hide the header (`true`) or show the header (`false`).
    /// - Returns: Button that hides/shows the header.
    func hideHeader(_ hideHeader: Bool = true) -> CUIExpandableButton {
        var newSelf = self

        newSelf._hideHeader = hideHeader

        return newSelf
    }
}
