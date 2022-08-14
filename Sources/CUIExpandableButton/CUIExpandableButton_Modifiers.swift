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

/// Convenience methods to modifer the Expandeble Button.
public extension CUIExpandableButton {
    /// Sets the title of the button.
    ///
    /// Refer to ``CUIExpandableButton``.
    func title(_ title: String) -> CUIExpandableButton {
        CUIExpandableButton(
            expanded: self.$expanded,
            title: title,
            subtitle: self.subtitle,
            options: self.options,
            icon: { self.icon },
            content: { self.content },
            action: self.action
        )
    }

    /// Sets the subtitle of the button.
    ///
    /// Refer to ``CUIExpandableButton``.
    func subtitle(_ subtitle: String) -> CUIExpandableButton {
        CUIExpandableButton(
            expanded: self.$expanded,
            title: self.title,
            subtitle: subtitle,
            options: self.options,
            icon: { self.icon },
            content: { self.content },
            action: self.action
        )
    }

    /// Sets the options of the button.
    ///
    /// Refer to ``CUIExpandableButtonOptions``.
    func options(_ options: CUIExpandableButtonOptions) -> CUIExpandableButton {
        CUIExpandableButton(
            expanded: self.$expanded,
            title: self.title,
            subtitle: self.subtitle,
            options: options,
            icon: { self.icon },
            content: { self.content },
            action: self.action
        )
    }

    /// Sets the options when the button is collapsed
    ///
    /// Refer to ``CUIExpandableButtonOptions.Collapsed``.
    func collapsedOptions(_ collapsedOptions: CUIExpandableButtonOptions.Collapsed) -> CUIExpandableButton {
        self.options({
            var newOptions = self.options
            newOptions.collapsedOptions = collapsedOptions
            return newOptions
        }())
    }

    /// Sets the options when the button is expanded.
    ///
    /// Refer to ``CUIExpandableButtonOptions.Expanded``.
    func expandedOptions(_ expandedOptions: CUIExpandableButtonOptions.Expanded) -> CUIExpandableButton {
        self.options({
            var newOptions = self.options
            newOptions.expandedOptions = expandedOptions
            return newOptions
        }())
    }

    /// Sets the font for the title of the button.
    ///
    /// Refer to ``CUIExpandableButtonOptions.titleFont``.
    func titleFont(_ titleFont: Font) -> CUIExpandableButton {
        self.options({
            var newOptions = self.options
            newOptions.titleFont = titleFont
            return newOptions
        }())
    }

    /// Sets the font for the subtitle of the button.
    ///
    /// Refer to ``CUIExpandableButtonOptions.subtitleFont``.
    func subtitleFont(_ subtitleFont: Font) -> CUIExpandableButton {
        self.options({
            var newOptions = self.options
            newOptions.subtitleFont = subtitleFont
            return newOptions
        }())
    }

    /// Sets the color for the background of the button.
    ///
    /// Refer to ``CUIExpandableButtonOptions.backgroundColor``.
    func backgroundColor(_ backgroundColor: Color) -> CUIExpandableButton {
        self.options({
            var newOptions = self.options
            newOptions.backgroundColor = backgroundColor
            return newOptions
        }())
    }
}
