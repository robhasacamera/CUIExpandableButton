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

// TODO: Finish implementing new modifiers
public extension CUIExpandableButton {
    /// Warning! This will reset other modifiers.
    func standardLayout(title: String?, subtitle: String?) -> CUIExpandableButton {
        // TODO: Explicitly set the other states in here.
        self
            .title(title, forState: .expanded)
            .subtitle(subtitle, forState: .expanded)
            .backgroundColor(nil)
    }

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

    func backgroundColor(
        _ color: Color?,
        forState state: CUIExpandableButtonState = .any
    ) -> CUIExpandableButton {
        var newSelf = self

        newSelf._backgroundColor.setValue(color, forState: state)

        return newSelf
    }
}

/// Convenience methods to modifer the Expandeble Button.
public extension CUIExpandableButton {

    /// Sets the options of the button.
    ///
    /// Refer to ``CUIExpandableButtonOptions``.
    func options(_ options: CUIExpandableButtonOptions) -> CUIExpandableButton {
        CUIExpandableButton(
            expanded: self.$expanded,
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
}
