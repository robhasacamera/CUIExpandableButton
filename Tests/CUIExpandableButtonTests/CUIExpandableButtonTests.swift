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

    func captureDynamicSizeSnapshots<Content>(
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line,
        @ViewBuilder content: () -> Content) where Content: View {
        for size in ContentSizeCategory.allCases {
            assertSnapshot(
                matching: content().environment(\.sizeCategory, size),
                as: .image,
                file: file,
                testName: testName,
                line: line
            )
        }
    }

    func testButtonWithSFSymbolCollpased() throws {
        let button = CUIExpandableButton(
            expanded: .constant(false),
            sfSymbolName: "gearshape.fill") {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpanded() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill") {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenIcon() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideIcon) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideTitle) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideCloseButton) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenSeparator() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideSeparator) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenHeader() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty",
            headerOptions: .hideHeader) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Did you get that Marty?",
            headerOptions: [.hideIcon, .hideCloseButton]) {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty") {
                mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithForegroundColor() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            sfSymbolName: "gearshape.fill",
            title: "Marty") {
                mockContent
        }
        .foregroundColor(.yellow)

        captureDynamicSizeSnapshots {
            button
        }
    }

    // MARK: - Custom Icon Tests

    func testButtonWithCustomIconCollapsed() throws {
        let button = CUIExpandableButton(expanded: .constant(false)) {
            mockCustomIcon
        } content: {
            mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithCustomIconExpanded() throws {
        let button = CUIExpandableButton(expanded: .constant(true)) {
            mockCustomIcon
        } content: {
            mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithTitle() throws {
        let button = CUIExpandableButton(
            expanded: .constant(true),
            title: "Marty") {
                mockCustomIcon
        } content: {
            mockContent
        }

        captureDynamicSizeSnapshots {
            button.prepForTest
        }
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

        captureDynamicSizeSnapshots {
            button
        }
    }
}

extension CUIExpandableButton {
    var prepForTest: some View {
        // FIXME: This must be done, otherwise the defaults for snapshot tests end up being a mix of black and white.
        self.foregroundColor(.black)
    }
}
