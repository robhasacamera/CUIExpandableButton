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

import CUIPreviewKit
import SwiftUI

// MARK: - Preview Helpers

enum Mock {
    static let title = "Marty"
    static let subtitle = "McFly"
    static let sfSymbolName = "gearshape.fill"

    static var content: some View {
        Text(LoremIpsum.words(2))
            .font(.body)
            .padding(.standardSpacing)
            .frame(width: 200)
    }
}

// MARK: - Preview Sets

// MARK: Collapsed Options

struct CUIExpandableButtonPreview_CollapsedOptions: View {
    @State var collapsed0: Bool = false
    @State var collapsed1: Bool = false
    @State var collapsed2: Bool = false
    @State var collapsed3: Bool = false
    @State var collapsed4: Bool = false
    @State var collapsed5: Bool = false
    @State var collapsed6: Bool = false

    var body: some View {
        CUICenteredPreview(title: "Collapsed State") {
            VStack {
                CUICaptionedView("No Modifiers") {
                    CUIExpandableButton(
                        expanded: $collapsed0,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                        collapsed6 = false
                    }
                }

                CUICaptionedView(".standardLayout(...)") {
                    CUIExpandableButton(
                        expanded: $collapsed1,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                        collapsed6 = false
                    }
                    .standardLayout(
                        title: Mock.title,
                        subtitle: Mock.subtitle
                    )
                }

                CUICaptionedView(".title(...)") {
                    CUIExpandableButton(
                        expanded: $collapsed2,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                        collapsed6 = false
                    }
                    .title(Mock.title)
                }

                CUICaptionedView(".subtitle(...)") {
                    CUIExpandableButton(
                        expanded: $collapsed3,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed4 = false
                        collapsed5 = false
                        collapsed6 = false
                    }
                    .subtitle(Mock.subtitle)
                }

                CUICaptionedView(".hideIcon") {
                    CUIExpandableButton(
                        expanded: $collapsed4,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed5 = false
                        collapsed6 = false
                    }
                    .hideIcon()
                }

                CUICaptionedView(".title(...) & .subtitle(...)") {
                    CUIExpandableButton(
                        expanded: $collapsed5,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed6 = false
                    }
                    .title(Mock.title)
                    .subtitle(Mock.title)
                }

                CUICaptionedView(".hideBackground") {
                    CUIExpandableButton(
                        expanded: $collapsed6,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        collapsed0 = false
                        collapsed1 = false
                        collapsed2 = false
                        collapsed3 = false
                        collapsed4 = false
                        collapsed5 = false
                    }
                    .hideBackground()
                }
            }
            .animation(.default, value: collapsed0)
            .animation(.default, value: collapsed1)
            .animation(.default, value: collapsed2)
            .animation(.default, value: collapsed3)
            .animation(.default, value: collapsed4)
            .animation(.default, value: collapsed5)
            .animation(.default, value: collapsed6)
        }
    }
}

// MARK: Expanded Options

struct CUIExpandableButtonPreview_ExpandedOptions: View {
    @State var expanded0: Bool = true
    @State var expanded1: Bool = false
    @State var expanded2: Bool = false
    @State var expanded3: Bool = false
    @State var expanded4: Bool = false
    @State var expanded5: Bool = false
    @State var expanded6: Bool = false
    @State var expanded7: Bool = false

    var body: some View {
        CUICenteredPreview(title: "Expanded Options") {
            VStack {
                CUICaptionedView("No Modifiers") {
                    CUIExpandableButton(
                        expanded: $expanded0,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                        expanded7 = false
                    }
                }

                CUICaptionedView(".standardLayout(...)") {
                    CUIExpandableButton(
                        expanded: $expanded1,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                        expanded7 = false
                    }
                    .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                }

                CUICaptionedView(".hideIcon(...)") {
                    CUIExpandableButton(
                        expanded: $expanded2,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                        expanded7 = false
                    }
                    .hideIcon()
                }

                CUICaptionedView(".title(...)") {
                    CUIExpandableButton(
                        expanded: $expanded3,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                        expanded7 = false
                    }
                    .title(Mock.title)
                }

                CUICaptionedView(".subtitle(...)") {
                    CUIExpandableButton(
                        expanded: $expanded4,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded2 = false
                        expanded1 = false
                        expanded3 = false
                        expanded5 = false
                        expanded6 = false
                        expanded7 = false
                    }
                    .subtitle(Mock.subtitle)
                }

                CUICaptionedView(".hideCloseButton()") {
                    CUIExpandableButton(
                        expanded: $expanded5,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded6 = false
                        expanded7 = false
                    }
                    .hideCloseButton()
                }

                CUICaptionedView(".hideHeader()") {
                    CUIExpandableButton(
                        expanded: $expanded6,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded7 = false
                    }
                    .hideHeader()
                }

                CUICaptionedView(".hideBackground(...)") {
                    CUIExpandableButton(
                        expanded: $expanded7,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    } action: {
                        expanded0 = false
                        expanded1 = false
                        expanded2 = false
                        expanded3 = false
                        expanded4 = false
                        expanded5 = false
                        expanded6 = false
                    }
                    .hideBackground()
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: expanded1)
            .animation(.default, value: expanded2)
            .animation(.default, value: expanded3)
            .animation(.default, value: expanded4)
            .animation(.default, value: expanded5)
            .animation(.default, value: expanded6)
            .animation(.default, value: expanded7)
        }
    }
}

// MARK: Other Options

struct CUIExpandableButtonPreview_OtherOptions: View {
    @State var expanded0: Bool = true
    @State var expanded1: Bool = true
    @State var expanded2: Bool = true

    var body: some View {
        CUICenteredPreview(title: "Other Options") {
            VStack {
                CUICaptionedView(".title(Mock.title, font: .title)") {
                    CUIExpandableButton(
                        expanded: $expanded0,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    }
                    .title(Mock.title, font: .title)
                }

                CUICaptionedView(".subtitle(Mock.subtitle, font: .caption)") {
                    CUIExpandableButton(
                        expanded: $expanded1,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Text(LoremIpsum.words(8))
                            .font(.body)
                            .padding(.standardSpacing)
                            .frame(width: 200)
                    }
                    .subtitle(Mock.subtitle, font: .caption)
                }

                CUICaptionedView("backgroundColor: .cyan.opacity(0.5)") {
                    CUIExpandableButton(
                        expanded: $expanded2,
                        sfSymbolName: Mock.sfSymbolName
                    ) {
                        Mock.content
                    }
                    .backgroundColor(.cyan.opacity(0.5))
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: expanded1)
            .animation(.default, value: expanded2)
        }
    }
}

// MARK: Custom Icons

struct CUIExpandableButtonPreview_CustomIcons: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    @State var collapsed2: Bool = false
    @State var expanded2: Bool = true

    @State var collapsed3: Bool = false
    @State var expanded3: Bool = true

    var smallIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 20, height: 20)
            .padding(8)
    }

    var wideIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 100, height: 20)
            .padding(8)
    }

    var tallIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 20, height: 100)
            .padding(8)
    }

    var largeIcon: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .frame(width: 100, height: 100)
            .padding(8)
    }

    var body: some View {
        CUICenteredPreview(title: "Custom Icons") {
            VStack {
                CUICaptionedView("smallIcon") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed0
                        ) {
                            smallIcon
                        } content: {
                            Mock.content
                        } action: {
                            expanded0 = !collapsed0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded0
                        ) {
                            smallIcon
                        } content: {
                            Mock.content
                        } action: {
                            collapsed0 = !expanded0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }

                CUICaptionedView("wideIcon") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed1
                        ) {
                            wideIcon
                        } content: {
                            Mock.content
                        } action: {
                            expanded1 = !collapsed1
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded1
                        ) {
                            wideIcon
                        } content: {
                            Mock.content
                        } action: {
                            collapsed1 = !expanded1
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }

                CUICaptionedView("tallIcon") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed2
                        ) {
                            tallIcon
                        } content: {
                            Mock.content
                        } action: {
                            expanded2 = !collapsed2
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded2
                        ) {
                            tallIcon
                        } content: {
                            Text(LoremIpsum.words(2))
                                .font(.body)
                                .padding(.standardSpacing)
                                .frame(width: 200)
                        } action: {
                            collapsed2 = !expanded2
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }

                CUICaptionedView("largeIcon") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed3
                        ) {
                            largeIcon
                        } content: {
                            Mock.content
                        } action: {
                            expanded3 = !collapsed3
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded3
                        ) {
                            largeIcon
                        } content: {
                            Mock.content
                        } action: {
                            collapsed3 = !expanded3
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
            .animation(.default, value: expanded2)
            .animation(.default, value: collapsed2)
            .animation(.default, value: expanded3)
            .animation(.default, value: collapsed3)
        }
    }
}

// MARK: Modifiers

struct CUIExpandableButtonPreview_Modifiers: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    var body: some View {
        CUICenteredPreview(title: "Modifiers") {
            VStack {
                CUICaptionedView(".foregroundColor(.yellow)") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded0 = !collapsed0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .foregroundColor(.yellow)

                        CUIExpandableButton(
                            expanded: $expanded0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed0 = !expanded0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .foregroundColor(.yellow)
                    }
                }

                #if swift(>=5.7)
                    if #available(iOS 16.0, *) {
                        CUICaptionedView(".fontWeight(.bold)") {
                            HStack {
                                CUIExpandableButton(
                                    expanded: $collapsed1,
                                    sfSymbolName: Mock.sfSymbolName
                                ) {
                                    Mock.content
                                } action: {
                                    expanded1 = !collapsed1
                                }
                                .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                                .fontWeight(.bold)

                                CUIExpandableButton(
                                    expanded: $expanded1,
                                    sfSymbolName: Mock.sfSymbolName
                                ) {
                                    Mock.content
                                } action: {
                                    collapsed1 = !expanded1
                                }
                                .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                                .fontWeight(.bold)
                            }
                        }
                    }
                #endif
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
        }
    }
}

struct CUIExpandableButtonPreview_BackgroundMaterial: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    @State var collapsed2: Bool = false
    @State var expanded2: Bool = true

    @State var collapsed3: Bool = false
    @State var expanded3: Bool = true

    @State var collapsed4: Bool = false
    @State var expanded4: Bool = true

    @State var collapsed5: Bool = false
    @State var expanded5: Bool = true

    var body: some View {
        CUICenteredPreview(title: "Background Material") {
            VStack {
                CUICaptionedView("Default") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded0 = !collapsed0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed0 = !expanded0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }

                CUICaptionedView(".thinMaterial") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed1,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded1 = !collapsed1
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.thinMaterial)

                        CUIExpandableButton(
                            expanded: $expanded1,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed1 = !expanded1
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.thinMaterial)
                    }
                }

                CUICaptionedView(".regularMaterial") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed2,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded2 = !collapsed2
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.regularMaterial)

                        CUIExpandableButton(
                            expanded: $expanded2,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed2 = !expanded2
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.regularMaterial)
                    }
                }

                CUICaptionedView(".ultraThickMaterial") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed3,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded3 = !collapsed3
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.ultraThickMaterial)

                        CUIExpandableButton(
                            expanded: $expanded3,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed3 = !expanded3
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(.ultraThickMaterial)
                    }
                }

                CUICaptionedView("nil") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed4,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded4 = !collapsed4
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(nil)

                        CUIExpandableButton(
                            expanded: $expanded4,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed4 = !expanded4
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(nil)
                    }
                }

                CUICaptionedView("nil with .backgroundColor(.blue.opacity(0.10))") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed5,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded5 = !collapsed5
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(nil)
                        .backgroundColor(.blue.opacity(0.10))

                        CUIExpandableButton(
                            expanded: $expanded5,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed5 = !expanded5
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .backgroundMaterial(nil)
                        .backgroundColor(.blue.opacity(0.10))
                    }
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
            .animation(.default, value: expanded2)
            .animation(.default, value: collapsed2)
            .animation(.default, value: expanded3)
            .animation(.default, value: collapsed3)
            .animation(.default, value: expanded4)
            .animation(.default, value: collapsed4)
            .animation(.default, value: expanded5)
            .animation(.default, value: collapsed5)
        }
    }
}

struct CUIExpandableButtonPreview_CornerRadius: View {
    @State var collapsed0: Bool = false
    @State var expanded0: Bool = true

    @State var collapsed1: Bool = false
    @State var expanded1: Bool = true

    var body: some View {
        CUICenteredPreview(title: "Corner Radius") {
            VStack {
                CUICaptionedView("Default") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded0 = !collapsed0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)

                        CUIExpandableButton(
                            expanded: $expanded0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed0 = !expanded0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                    }
                }

                CUICaptionedView(".cornerRadius(5.0)") {
                    HStack {
                        CUIExpandableButton(
                            expanded: $collapsed0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            expanded0 = !collapsed0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .buttonCornerRadius(5.0)

                        CUIExpandableButton(
                            expanded: $expanded0,
                            sfSymbolName: Mock.sfSymbolName
                        ) {
                            Mock.content
                        } action: {
                            collapsed0 = !expanded0
                        }
                        .standardLayout(title: Mock.title, subtitle: Mock.subtitle)
                        .buttonCornerRadius(5.0)
                    }
                }
            }
            .animation(.default, value: expanded0)
            .animation(.default, value: collapsed0)
            .animation(.default, value: expanded1)
            .animation(.default, value: collapsed1)
        }
    }
}

// MARK: PreviewProvider

struct CUIExpandableButton_Previews: PreviewProvider {
    static var previews: some View {
        CUIExpandableButtonPreview_CollapsedOptions()

        CUIExpandableButtonPreview_ExpandedOptions()

        CUIExpandableButtonPreview_OtherOptions()

        CUIExpandableButtonPreview_CustomIcons()

        CUIExpandableButtonPreview_Modifiers()

        CUIExpandableButtonPreview_BackgroundMaterial()

        CUIExpandableButtonPreview_CornerRadius()
    }
}
