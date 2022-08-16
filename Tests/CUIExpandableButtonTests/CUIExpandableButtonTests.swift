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
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .hideIcon(forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle, forState: .collapsed)
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .hideCloseButton()
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenSeparator() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .hideSeparator()
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedHiddenHeader() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .hideHeader()
            .prepForTest
        }
    }

    func testButtonWithSFSymbolAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title("Did you get that Marty?")
            .hideIcon(forState: .expanded)
            .hideCloseButton()
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .prepForTest
        }
    }

    func testButtonWithSFSymbolExpandedWithForegroundColor() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
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
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(expanded: .constant(true)) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenIcon() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .hideIcon(forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                options: CUIExpandableButtonOptions(
                    expandedOptions: .hideTitle
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle, forState: .collapsed)
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .hideCloseButton()
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenSeparator() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .hideSeparator()
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithHiddenHeader() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .hideHeader()
            .prepForTest
        }
    }

    func testButtonWithCustomIconAndLongTitleExpandedWithHiddenIconAndCloseButton() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .hideIcon(forState: .expanded)
            .hideCloseButton()
            .title("Did you get that Marty?")
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithTitle() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .prepForTest
        }
    }

    func testButtonWithCustomIconExpandedWithForegroundColor() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .foregroundColor(.yellow)
        }
    }

    func testButtonWithCustomTallIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false)
            ) {
                mockCustomSizeIcon(width: 20, height: 100)
            } content: {
                mockContent
            }
            .title(mockTitle, forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithCustomTallIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomSizeIcon(width: 20, height: 100)
            } content: {
                mockContent
            }
            .title(mockTitle)
            .prepForTest
        }
    }

    func testButtonWithCustomWideIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false)
            ) {
                mockCustomSizeIcon(width: 100, height: 20)
            } content: {
                mockContent
            }
            .title(mockTitle, forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithCustomWideIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomSizeIcon(width: 100, height: 20)
            } content: {
                mockContent
            }
            .title(mockTitle)
            .prepForTest
        }
    }

    func testButtonWithCustomLargeIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false)
            ) {
                mockCustomSizeIcon(width: 100, height: 100)
            } content: {
                mockContent
            }
            .title(mockTitle, forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithCustomLargeIconExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomSizeIcon(width: 100, height: 100)
            } content: {
                mockContent
            }
            .title(mockTitle)
            .prepForTest
        }
    }

    func testButtonWithSFIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithSFIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithCustomIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithCustomIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithNoIconTitleAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .hideIcon(forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithNoIconAndSubtitleExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .subtitle(mockSubtitle)
            .hideIcon(forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithTitleAndSubtitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showTitleAndSubtitle
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithTitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showTitle
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .subtitle(mockSubtitle, forState: .expanded)
            .prepForTest
        }
    }

    func testButtonWithSubtitleDisplayedWhenCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                options: CUIExpandableButtonOptions(
                    collapsedOptions: .showSubtitle
                )
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle, forState: .expanded)
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithCustomTitleFont() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle, font: .largeTitle)
            .subtitle(mockSubtitle)
            .prepForTest
        }
    }

    func testButtonWithCustomSubTitleFont() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .title(mockTitle)
            .subtitle(mockSubtitle, font: .caption2)
            .prepForTest
        }
    }

    func testButtonWithCustomBackgroundColor() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true)
            ) {
                mockCustomIcon
            } content: {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .backgroundColor(.cyan)
            .prepForTest
        }
    }

    func testButtonWithHiddenIconCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .hideIcon(forState: .collapsed)
            .prepForTest
        }
    }

    func testButtonWithHiddenIconAndTitleSubtitleDisplayed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .title(mockTitle)
            .subtitle(mockSubtitle)
            .hideIcon(forState: .collapsed)
            .prepForTest
        }
    }

    func testButtonWithHiddenBackgroundCollapsed() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(false),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .hideBackground(true, forState: .collapsed)
            .prepForTest
        }
    }

    func testButtonWithHiddenBackgroundExpanded() throws {
        // isRecording = true
        captureDynamicSizeSnapshots {
            CUIExpandableButton(
                expanded: .constant(true),
                sfSymbolName: "gearshape.fill"
            ) {
                mockContent
            }
            .standardLayout(title: mockTitle, subtitle: mockSubtitle)
            .hideBackground(true, forState: .expanded)
            .prepForTest
        }
    }
}

extension CUIExpandableButton {
    var prepForTest: some View {
        // FIXME: This must be done, otherwise the defaults for snapshot tests end up being a mix of black and white.
        self.foregroundColor(.black)
    }
}
