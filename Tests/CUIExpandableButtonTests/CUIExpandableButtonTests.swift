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

@testable import CUIExpandableButton
import SnapshotTesting
import SwiftUI
import XCTest

final class CUIExpandableButtonTests: XCTestCase {
    var mockCustomIcon: some View {
        Text("M")
            .font(.title)
    }

    var mockContent: some View {
        Text("What's a gigwatt?").padding(.standardSpacing)
    }

    override func tearDown() async throws {
        // If we overwrite a snapshot, we want it to be just the snapshot we're intentionally changing.
        isRecording = false

        try await super.tearDown()
    }

    // MARK: - SF Symbol Tests

    func testButtonWithSFSymbolCollpased() throws {
        let button = CUIExpandableButton(
            expanded: .constant(false),
            sfSymbolName: "gearshape.fill") {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpanded() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill") {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedHiddenIcon() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideIcon) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedHiddenTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideTitle) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedHiddenCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideCloseButton) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedHiddenSeparator() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideSeparator) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedHiddenHeader() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideHeader) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Did you get that Marty?",
            headerOptions: [.hideIcon, .hideCloseButton]) {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedWithTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty") {
                mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithSFSymbolExpandedWithForegroundColor() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty") {
                mockContent
        }
        .foregroundColor(.yellow)

        assertSnapshot(matching: button, as: .image)
    }

    // MARK: - Custom Icon Tests

    func testButtonWithCustomIconCollapsed() throws {
        let button = CUIExpandableButton(expanded: .constant(false)) {
            mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpanded() throws {
        let button = CUIExpandableButton(expanded: .constant(true)) {
            mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithHiddenIcon() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty",
            headerOptions: .hideIcon) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithHiddenTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty",
            headerOptions: .hideTitle) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithHiddenCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty",
            headerOptions: .hideCloseButton) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithHiddenSeparator() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty",
            headerOptions: .hideSeparator) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithHiddenHeader() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty",
            headerOptions: .hideHeader) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Did you get that Marty?",
            headerOptions: [.hideIcon, .hideCloseButton]) {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty") {
                mockCustomIcon
        } content: {
            mockContent
        }

        assertSnapshot(matching: button.prepForTest, as: .image)
    }

    func testButtonWithCustomIconExpandedWithForegroundColor() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty") {
                mockCustomIcon
        } content: {
            mockContent
        }
        .foregroundColor(.yellow)

        assertSnapshot(matching: button, as: .image)
    }
}

extension CUIExpandableButton {
    var prepForTest: some View {
        // FIXME: This must be done, otherwise the defaults for snapshot tests end up being a mix of black and white.
        self.foregroundColor(.black)
    }
}
