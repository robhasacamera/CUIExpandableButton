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
    // TODO: When moving methods to Style protocols, this stays as a specialize protocol for the expandable button
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
            .title(expanded ? title : nil)
            .subtitle(expanded ? subtitle : nil)
            .backgroundColor(nil)
            .hideBackground(false)
            .hideIcon(false)
            .hideSeparator(false)
            .hideCloseButton(false)
            .hideHeader(false)
            .backgroundMaterial(nil)
            .buttonCornerRadius(nil)
    }
}
