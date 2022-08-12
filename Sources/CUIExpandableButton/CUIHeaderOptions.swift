//
//  File.swift
//
//
//  Created by Robert Cole on 7/26/22.
//

import Foundation

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
