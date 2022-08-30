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

/// Provides a common interface for stylizing controls
public protocol CUIStylizedControl: CUIView {
    associatedtype Control: CUIStylizedControl

    var title: String? { get set }
    var titleFont: Font? { get set }
    var subtitle: String? { get set }
    var subtitleFont: Font? { get set }
    var hideBackground: Bool { get set }
    var backgroundMaterial: Material? { get set }
    var backgroundColor: Color? { get set }
    var cornerRadius: CGFloat? { get set }
    var hideIcon: Bool { get set }

    /// Sets the title to display for the button.
    ///
    /// A value of `nil` will hide the title.
    /// - Parameters:
    ///   - title: The title to display.
    ///   - font: The font to use when  displaying the title.
    /// - Returns: Button that displays the provided title.
    func title(
        _ title: String?,
        font: Font?
    ) -> Control

    /// Sets the subtitle to display for the button.
    ///
    /// A value of `nil` will hide the subtitle.
    /// - Parameters:
    ///   - subtitle: The subtitle to display.
    ///   - font: The font to use when displaying  the subtitle.
    /// - Returns: Button that displays the provided subtitle.
    func subtitle(
        _ subtitle: String?,
        font: Font?
    ) -> Control

    /// Sets the background color for the button.
    ///
    /// When setting this to a non-nil value, the material background is still
    /// rendered underneath. A transparent color will show the material
    /// background underneath.
    /// - Parameters:
    ///   - color: The color for the background.
    /// - Returns: Button that displays the provided background color.
    func backgroundColor(
        _ color: Color?
    ) -> Control

    // TODO: Add option for which background to hide? Color, material, all?
    /// Hides the background for the button.
    ///
    /// This function accepts a `Bool` to allow hiding the background to be
    /// toggled.
    /// - Parameters:
    ///   - hideBackground: Indicates whether to hide the background
    ///   (`true`) or show the background (`false`).
    /// - Returns: Button that hides/shows the background.
    func hideBackground(
        _ hideBackground: Bool
    ) -> Control

    /// Hides the icon for the button.
    ///
    /// This function accepts a `Bool` to allow hiding the icon to be toggled.
    /// - Parameters:
    ///   - hideIcon: Indicates whether to hide the icon (`true`) or show the icon (`false`).
    /// - Returns: Button that hides/shows the icon.
    func hideIcon(
        _ hideIcon: Bool
    ) -> Control

    /// Sets the corner radius of the button when collapsed/expanded.
    ///
    /// When collapsed, the max value is always capped at width / 2.0. Unless the height is less than
    /// the width, in which case it's max value is height / 2.0. Any value greater than this will be ignored.
    /// - Parameters:
    ///   - radius: The radius for the corners of the button. A value of `nil` will use the default value instead.
    /// - Returns: Button that has corners rounded at the provided radius.
    func buttonCornerRadius(
        _ radius: CGFloat?
    ) -> Control

    /// Sets the material of the background of the button.
    ///
    /// A `nil` value will hide the material background altogether, however background color will still be applied.
    /// - Parameters:
    ///   - material: The material to use for the background.
    /// - Returns: Button that has a background using the material provided.
    func backgroundMaterial(
        _ material: Material?
    ) -> Control
}

public extension CUIStylizedControl {
    func title(
        _ title: String?,
        font: Font? = nil
    ) -> Control {
        var newSelf = self

        newSelf.title = title
        newSelf.titleFont = font

        return newSelf as! Self.Control
    }

    func subtitle(
        _ subtitle: String?,
        font: Font? = nil
    ) -> Control {
        var newSelf = self

        newSelf.subtitle = subtitle
        newSelf.subtitleFont = font

        return newSelf as! Self.Control
    }

    func backgroundColor(
        _ color: Color?
    ) -> Control {
        var newSelf = self

        newSelf.backgroundColor = color

        return newSelf as! Self.Control
    }

    func hideBackground(
        _ hideBackground: Bool = true
    ) -> Control {
        var newSelf = self

        newSelf.hideBackground = hideBackground

        return newSelf as! Self.Control
    }

    func hideIcon(
        _ hideIcon: Bool = true
    ) -> Control {
        var newSelf = self

        newSelf.hideIcon = hideIcon

        return newSelf as! Self.Control
    }

    func buttonCornerRadius(
        _ radius: CGFloat?
    ) -> Control {
        var newSelf = self

        newSelf.cornerRadius = radius

        return newSelf as! Self.Control
    }

    func backgroundMaterial(
        _ material: Material?
    ) -> Control {
        var newSelf = self

        newSelf.backgroundMaterial = material

        return newSelf as! Self.Control
    }
}

protocol _CUIStylizedControl: CUIStylizedControl {
    associatedtype _Control: CUIStylizedControl

    var control: _Control { get set }
}

extension _CUIStylizedControl {
    public var title: String? {
        get {
            control.title
        } set {
            var newButton = control

            newButton.title = newValue

            control = newButton
        }
    }

    public var titleFont: Font? {
        get {
            control.titleFont
        }
        set {
            var newButton = control

            newButton.titleFont = newValue

            control = newButton
        }
    }

    public var subtitle: String? {
        get {
            control.subtitle
        } set {
            var newButton = control

            newButton.subtitle = newValue

            control = newButton
        }
    }

    public var subtitleFont: Font? {
        get {
            control.subtitleFont
        } set {
            var newButton = control

            newButton.subtitleFont = newValue

            control = newButton
        }
    }

    public var hideBackground: Bool {
        get {
            control.hideBackground
        } set {
            var newButton = control

            newButton.hideBackground = newValue

            control = newButton
        }
    }

    public var backgroundMaterial: Material? {
        get {
            control.backgroundMaterial
        } set {
            var newButton = control

            newButton.backgroundMaterial = newValue

            control = newButton
        }
    }

    public var backgroundColor: Color? {
        get {
            control.backgroundColor
        } set {
            var newButton = control

            newButton.backgroundColor = newValue

            control = newButton
        }
    }

    public var cornerRadius: CGFloat? {
        get {
            control.cornerRadius
        } set {
            var newButton = control

            newButton.cornerRadius = newValue

            control = newButton
        }
    }

    public var hideIcon: Bool {
        get {
            control.hideIcon
        } set {
            var newButton = control

            newButton.hideIcon = newValue

            control = newButton
        }
    }
}

