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

/// A set of options for customizing ``CUIExpandableButton``
public struct CUIExpandableButtonOptions {
    /// Options that customize the button while collapsed.
    public var collapsedOptions: Collapsed = .none
    /// Options that customize the button while expanded.
    public var expandedOptions: Expanded = .none
    /// The font to use for the title.
    public var titleFont: Font? = nil
    /// The font to use for the subtitle.
    public var subtitleFont: Font? = nil
    /// The color to use for the background.
    ///
    /// Providing a custom color does not prevent the material background from
    /// rendering. Instead the material background is rendered behind the color
    /// background. This means that a transparent background will show the
    /// material background behind it.
    public var backgroundColor: Color? = nil

    public init(
        collapsedOptions: CUIExpandableButtonOptions.Collapsed = .none,
        expandedOptions: CUIExpandableButtonOptions.Expanded = .none,
        titleFont: Font? = nil,
        subtitleFont: Font? = nil,
        backgroundColor: Color? = nil
    ) {
        self.collapsedOptions = collapsedOptions
        self.expandedOptions = expandedOptions
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.backgroundColor = backgroundColor
    }

    /// Options that customize the button when in the collapsed state
    public struct Collapsed: OptionSet, Identifiable, Hashable {
        public let rawValue: Int
        public var id: Int {
            rawValue
        }

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Shows the title when the button is collapsed.
        public static let showTitle = Collapsed(rawValue: 1 << 0)
        /// Shows the subtitle when the button is collapsed.
        public static let showSubtitle = Collapsed(rawValue: 1 << 1)
        /// Hides the icon when the button is collapsed.
        ///
        /// Warning: when hiding the icon, a title or subtitle should be displayed.
        public static let hideIcon = Collapsed(rawValue: 1 << 3)

        /// Emptyset of  options
        public static let none: Collapsed = []
        /// Shows the title and subtitle when the button is collapsed.
        public static let showTitleAndSubtitle: Collapsed = [.showTitle, .showSubtitle]
        /// Hides the icon and only shows the title and subtitle when the button is collapsed.
        public static let showTitleAndSubtitleOnly: Collapsed = [.hideIcon, .showTitle, .showSubtitle]
    }

    /// Options that customize the button when in the expanded state
    public struct Expanded: OptionSet, Identifiable, Hashable {
        public let rawValue: Int
        public var id: Int {
            rawValue
        }

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Hides the icon in the header.
        public static let hideIcon = Expanded(rawValue: 1 << 0)
        /// Hides the title in the header.
        public static let hideTitle = Expanded(rawValue: 1 << 1)
        /// Hides the title in the header.
        public static let hideSubtitle = Expanded(rawValue: 1 << 2)
        /// Hides the title and the subtitle in the header
        public static let hideTitleAndSubtitle: Expanded = [.hideTitle, .hideSubtitle]
        /// Hides the close button in the header.
        ///
        /// It's worth noting that close functionality will need to be provided by other means when this is active.
        public static let hideCloseButton = Expanded(rawValue: 1 << 3)
        /// Hides the separator between the header and the content area.
        public static let hideSeparator = Expanded(rawValue: 1 << 4)

        /// Emptyset of  options
        public static let none: Expanded = []
        /// Hide the entire header.
        ///
        /// When this happens the content space for the header area will be removed
        /// when expanded and the content will fill the entire expanded area.
        ///
        /// It's worth noting that close functionality will need to be provided by other means when this is active.
        public static let hideHeader: Expanded = [.hideIcon, .hideTitle, .hideSubtitle, .hideCloseButton, .hideSeparator]
    }

    // MARK: - Recipes

    /// Standard configuration for the button.
    public static var standard: CUIExpandableButtonOptions {
        CUIExpandableButtonOptions()
    }
    /// Show the title and subtitle when collapsed and expanded. If the title or the subtitle is nil, it will not be displayed.
    public static var alwaysShowTitleAndSubtitle: CUIExpandableButtonOptions {
        CUIExpandableButtonOptions(collapsedOptions: .showTitleAndSubtitle)
    }
    /// Hide the header hen fully expanded.
    public static var hideHeader: CUIExpandableButtonOptions {
        CUIExpandableButtonOptions(expandedOptions: .hideHeader)
    }
}
