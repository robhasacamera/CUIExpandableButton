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

import Foundation

// TODO: Create some standard recipes that can be used.
/// A set of options for customizing ``CUIExpandableButton``
public struct CUIExpandableButtonOptions {
    public let collapsedOptions: Collapsed
    public let expandedOptions: Expanded

    public init(
        collapsedOptions: CUIExpandableButtonOptions.Collapsed = .none,
        expandedOptions: CUIExpandableButtonOptions.Expanded = .none
    ) {
        self.collapsedOptions = collapsedOptions
        self.expandedOptions = expandedOptions
    }

    /// Options that customize the button when in the collapsed state
    public struct Collapsed: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Shows the title when the button is collapsed.
        public static let showTitleWhenCollapsed = Collapsed(rawValue: 1 << 0)
        /// Shows the subtitle when the button is collapsed.
        public static let showSubtitleWhenCollapsed = Collapsed(rawValue: 1 << 1)

        /// Emptyset of  options
        public static let none: Collapsed = []
        /// Shows the title and subtitle when the button is collapsed.
        public static let showTitleAndSubtitleWhenCollapsed: Collapsed = [.showTitleWhenCollapsed, .showSubtitleWhenCollapsed]
    }

    /// Options that customize the button when in the expanded state
    public struct Expanded: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Hides the icon in the header.
        public static let hideIcon = Expanded(rawValue: 1 << 0)
        /// Hides the title in the header.
        public static let hideTitle = Expanded(rawValue: 1 << 1)
        /// Hides the title in the header.
        public static let hideSubtitle = Expanded(rawValue: 1 << 2)
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
}

// TODO: Change into options
/// A set of options for customizing the header.
public struct CUIHeaderOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    // TODO: Make separate options for hiding these when collapsed or expanded, or maybe have different options sets for both. Expanded options, collapsed options
    /// Hides the icon in the header.
    public static let hideIcon = CUIHeaderOptions(rawValue: 1 << 0)
    /// Hides the title in the header.
    public static let hideTitle = CUIHeaderOptions(rawValue: 1 << 1)
    /// Hides the title in the header.
    public static let hideSubtitle = CUIHeaderOptions(rawValue: 1 << 2)
    /// Hides the close button in the header.
    ///
    /// It's worth noting that close functionality will need to be provided by other means when this is active.
    public static let hideCloseButton = CUIHeaderOptions(rawValue: 1 << 3)
    /// Hides the separator between the header and the content area.
    public static let hideSeparator = CUIHeaderOptions(rawValue: 1 << 4)
    // Shows the title when the button is collapsed.
    public static let showTitleWhenCollapsed = CUIHeaderOptions(rawValue: 1 << 5)
    // Shows the subtitle when the button is collapsed.
    public static let showSubtitleWhenCollapsed = CUIHeaderOptions(rawValue: 1 << 6)

    // Shows the title and subtitle when the button is collapsed.
    public static let showTitleAndSubtitleWhenCollapsed: CUIHeaderOptions = [.showTitleWhenCollapsed, .showSubtitleWhenCollapsed]
    /// Emptyset of header options
    public static let none: CUIHeaderOptions = []
    /// Hide the entire header.
    ///
    /// When this happens the content space for the header area will be removed
    /// when expanded and the content will fill the entire expanded area.
    ///
    /// It's worth noting that close functionality will need to be provided by other means when this is active.
    public static let hideHeader: CUIHeaderOptions = [.hideIcon, .hideTitle, .hideSubtitle, .hideCloseButton, .hideSeparator]
}
