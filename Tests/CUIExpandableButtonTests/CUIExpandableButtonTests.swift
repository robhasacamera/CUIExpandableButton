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
    var mockTitle = "Marty"
    var mockSubtitle = "McFly"

    var mockCustomIcon: some View {
        Text("M")
            .font(.title)
    }

    var mockContent: some View {
        Text("What's a gigwatt?").padding(.standardSpacing)
    }

    func mockCustomSizeIcon(width: CGFloat, height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(.black) // this is important, otherwise the layout behaves oddly
            .frame(width: width, height: height)
            .padding(.standardSpacing)
    }

    override func setUp() async throws {
        try await super.setUp()

        // isRecording = true
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
        @ViewBuilder content: () -> Content
    ) where Content: View {
        for size in ContentSizeCategory.allCases {
            assertSnapshot(
                matching: content().environment(\.sizeCategory, size),
                as: .image,
                file: file,
                testName: "\(testName).\(size)",
                line: line
            )
        }
    }

    func testButtonWithSFSymbolCollpased() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenIcon() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideIcon
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideTitle
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideCloseButton
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenSeparator() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideSeparator
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenHeader() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideHeader
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: "Did you get that Marty?",
                options: CUIExpandableButtonOptions(
                    expandedOptions: [.hideIcon, .hideCloseButton]
                )
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithForegroundColor() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle
            ) {
                mockContent
            }
            .foregroundColor(.yellow)
        }
    }

    // MARK: - Custom Icon Tests

    func testButtonWithCustomIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(expanded: .constant(false)) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(expanded: .constant(true)) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenIcon() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideIcon
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideTitle
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideCloseButton
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenSeparator() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideSeparator
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenHeader() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideHeader
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: "Did you get that Marty?",
                options: CUIExpandableButtonOptions(
                    expandedOptions: [.hideIcon, .hideCloseButton]
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithForegroundColor() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.foregroundColor(.yellow)
        }
    }

    func testButtonWithCustomTallIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 20, height: 100)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomTallIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 20, height: 100)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomWideIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 100, height: 20)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomWideIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 100, height: 20)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomLargeIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 100, height: 100)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomLargeIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle
            ) {
                mockCustomSizeIcon(width: 100, height: 100)
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                title: mockTitle,
                subtitle: mockSubtitle
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSFIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill",
                subtitle: mockSubtitle
            ) {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                subtitle: mockSubtitle
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithCustomIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                subtitle: mockSubtitle
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithNoIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                title: mockTitle,
                subtitle: mockSubtitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideIcon
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithNoIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                subtitle: mockSubtitle,
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideIcon
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithTitleAndSubtitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle,
                subtitle: mockSubtitle,
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showTitleAndSubtitleWhenCollapsed
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithTitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle,
                subtitle: mockSubtitle,
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showTitleWhenCollapsed
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }

    func testButtonWithSubtitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                title: mockTitle,
                subtitle: mockSubtitle,
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showSubtitleWhenCollapsed
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }.prepForTest
        }
    }
}

extension CUIExpandableButton {
    var prepForTest: some View {
        // FIXME: This must be done, otherwise the defaults for snapshot tests end up being a mix of black and white.
        self.foregroundColor(.black)
    }
}
