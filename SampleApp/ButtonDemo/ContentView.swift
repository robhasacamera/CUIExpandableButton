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

import CUIExpandableButton
import SwiftUI

struct ContentView: View {
    @State
    var expanded1: Bool = false
    @State
    var expanded2: Bool = false
    @State
    var expanded3: Bool = false

    @State
    var expanded4: Bool = true

    @State
    var textFieldString: String = "Compose here"
    @State
    var toggleBool1: Bool = true
    @State
    var toggleBool2: Bool = true
    @State
    var toggleBool3: Bool = true

    @State
    var showAlert = false

    @State
    var title = "Title"
    @State
    var subtitle = "Subtitle"
    @State
    var foregroundColor: Color? = nil
    @State
    var expandedOptions = CUIExpandableButtonOptions.Expanded.none
    @State
    var collapsedOptions = CUIExpandableButtonOptions.Collapsed.none
    @State
    var titleFont: Font? = nil
    @State
    var subtitleFont: Font? = nil
    @State
    var backgroundColor: Color? = nil

    var body: some View {
        VStack(spacing: 8.0) {
            HStack(alignment: .top) {
                CUIExpandableButton(
                    expanded: $expanded1,
                    sfSymbolName: "pencil"
                ) {
                    TextEditor(text: $textFieldString)
                        .frame(width: 200, height: 100)
                } action: {
                    expanded2 = false
                    expanded3 = false
                    expanded4 = false
                }

                CUIExpandableButton(
                    expanded: $expanded2,
                    sfSymbolName: "gearshape.fill"
                ) {
                    VStack {
                        Toggle("Setting 1", isOn: $toggleBool1)
                        Toggle("Setting 2", isOn: $toggleBool2)
                        Toggle("Setting 3", isOn: $toggleBool3)
                    }
                    .frame(width: 200)
                    .padding(8)

                } action: {
                    expanded1 = false
                    expanded3 = false
                    expanded4 = false
                }

                CUIExpandableButton(
                    expanded: $expanded3
                ) {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                } content: {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(8)
                } action: {
                    expanded1 = false
                    expanded2 = false
                    expanded4 = false
                }
            }

            Spacer()

            CUIExpandableButton(
                expanded: $expanded4,
                sfSymbolName: "tag.fill",
                title: title,
                subtitle: subtitle,
                options: CUIExpandableButtonOptions(
                    collapsedOptions: collapsedOptions,
                    expandedOptions: expandedOptions,
                    titleFont: titleFont,
                    subtitleFont: subtitleFont,
                    backgroundColor: backgroundColor
                )
            ) {
                Text("Customize this using the controls below.")
                    .frame(width: 200)
                    .padding(8)
                    .foregroundColor(nil)
            } action: {
                expanded1 = false
                expanded2 = false
                expanded3 = false
            }
            .foregroundColor(foregroundColor)

            Spacer()

            VStack {
                Toggle("Expanded", isOn: $expanded4)

                TextField("Title", text: $title)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 4).foregroundColor(.white.opacity(0.5)))
                TextField("Subtitle", text: $subtitle)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 4).foregroundColor(.white.opacity(0.5)))

                HStack {
                    Text("Foreground Color")

                    Spacer()
                    Picker(
                        "Please choose a color",
                        selection: $foregroundColor
                    ) {
                        Text("Default").tag(nil as Color?)
                        Text("Black").tag(Color.black as Color?)
                        Text("White").tag(Color.white as Color?)
                        Text("Red").tag(Color.red as Color?)
                        Text("Green").tag(Color.green as Color?)
                        Text("Cyan").tag(Color.cyan as Color?)
                        Text("Yellow").tag(Color.yellow as Color?)
                        Text("Purple").tag(Color.purple as Color?)
                        Text("Orange").tag(Color.orange as Color?)
                    }
                }
                HStack {
                    Text("Expanded Options")

                    Spacer()
                    Picker(
                        "Expanded Options",
                        selection: $expandedOptions
                    ) {
                        Text(".none").tag(CUIExpandableButtonOptions.Expanded.none)
                        Text(".hideIcon").tag(CUIExpandableButtonOptions.Expanded.hideIcon)
                        Text(".hideTitle").tag(CUIExpandableButtonOptions.Expanded.hideTitle)
                        Text(".hideSubtitle").tag(CUIExpandableButtonOptions.Expanded.hideSubtitle)
                        Text(".hideTitleAndSubtitle").tag(CUIExpandableButtonOptions.Expanded.hideTitleAndSubtitle)
                        Text(".hideCloseButton").tag(CUIExpandableButtonOptions.Expanded.hideCloseButton)
                        Text(".hideSeparator").tag(CUIExpandableButtonOptions.Expanded.hideSeparator)
                        Text(".hideHeader").tag(CUIExpandableButtonOptions.Expanded.hideHeader)
                    }
                }

                HStack {
                    Text("Collapsed Options")

                    Spacer()
                    Picker(
                        "Collapsed Options",
                        selection: $collapsedOptions
                    ) {
                        Text(".none").tag(CUIExpandableButtonOptions.Collapsed.none)
                        Text(".showTitle").tag(CUIExpandableButtonOptions.Collapsed.showTitle)
                        Text(".showSubtitle").tag(CUIExpandableButtonOptions.Collapsed.showSubtitle)
                        Text(".showTitleAndSubtitle").tag(CUIExpandableButtonOptions.Collapsed.showTitleAndSubtitle)
                        Text(".hideIcon").tag(CUIExpandableButtonOptions.Collapsed.hideIcon)
                        Text(".showTitleAndSubtitleOnly").tag(CUIExpandableButtonOptions.Collapsed.showTitleAndSubtitleOnly)
                    }
                }

                HStack {
                    Text("Title Font")

                    Spacer()
                    Picker(
                        "Title Font",
                        selection: $titleFont
                    ) {
                        Group {
                            Text("Default").tag(nil as Font?)
                            Text(".largeTitle").tag(Font.largeTitle as Font?)
                            Text(".title").tag(Font.title as Font?)
                            Text(".title2").tag(Font.title2 as Font?)
                            Text(".title3").tag(Font.title3 as Font?)
                            Text(".caption").tag(Font.caption as Font?)
                        }
                        Text(".caption2").tag(Font.caption2 as Font?)
                        Text(".callout").tag(Font.callout as Font?)
                        Text(".footnote").tag(Font.footnote as Font?)
                        Text(".body").tag(Font.body as Font?)
                        Text(".headline").tag(Font.headline as Font?)
                        Text(".subheadline").tag(Font.subheadline as Font?)
                    }
                }

                HStack {
                    Text("Subtitle Font")

                    Spacer()
                    Picker(
                        "Subtitle Font",
                        selection: $subtitleFont
                    ) {
                        Group {
                            Text("Default").tag(nil as Font?)
                            Text(".largeTitle").tag(Font.largeTitle as Font?)
                            Text(".title").tag(Font.title as Font?)
                            Text(".title2").tag(Font.title2 as Font?)
                            Text(".title3").tag(Font.title3 as Font?)
                            Text(".caption").tag(Font.caption as Font?)
                        }
                        Text(".caption2").tag(Font.caption2 as Font?)
                        Text(".callout").tag(Font.callout as Font?)
                        Text(".footnote").tag(Font.footnote as Font?)
                        Text(".body").tag(Font.body as Font?)
                        Text(".headline").tag(Font.headline as Font?)
                        Text(".subheadline").tag(Font.subheadline as Font?)
                    }
                }
                HStack {
                    Text("Background Color")

                    Spacer()
                    Picker(
                        "Background Color",
                        selection: $backgroundColor
                    ) {
                        Group {
                            Text("Default").tag(nil as Color?)
                            Text("Black").tag(Color.black as Color?)
                            Text("White").tag(Color.white as Color?)
                            Text("Red").tag(Color.red as Color?)
                            Text("Green").tag(Color.green as Color?)
                            Text("Cyan").tag(Color.cyan as Color?)
                            Text("Yellow").tag(Color.yellow as Color?)
                            Text("Purple").tag(Color.purple as Color?)
                            Text("Orange").tag(Color.orange as Color?)
                        }
                        Group {
                            Text("Black Tint").tag(Color.black.opacity(0.3) as Color?)
                            Text("White Tint").tag(Color.white.opacity(0.3) as Color?)
                            Text("Red Tint").tag(Color.red.opacity(0.2) as Color?)
                            Text("Green Tint").tag(Color.green.opacity(0.2) as Color?)
                            Text("Cyan Tint").tag(Color.cyan.opacity(0.2) as Color?)
                            Text("Yellow Tint").tag(Color.yellow.opacity(0.2) as Color?)
                            Text("Purple Tint").tag(Color.purple.opacity(0.2) as Color?)
                            Text("Orange Tint").tag(Color.orange.opacity(0.2) as Color?)
                        }
                    }
                }
            }
            .padding()

            .background(.thinMaterial)

            HStack {
                CUIExpandableButton(
                    sfSymbolName: "square.and.arrow.up"
                ) {
                    showAlert = true
                }.alert("This button only has an action, no expandable content", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }

                CUIExpandableButton {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                } action: {
                    showAlert = true
                }.alert("This button only has an action, no expandable content", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
        }
        .background(alignment: .center) {
            Image("Background")
                .centered()
                .edgesIgnoringSafeArea(.all)
        }
        .animation(.easeInOut, value: expanded1)
        .animation(.easeInOut, value: expanded2)
        .animation(.easeInOut, value: expanded3)
        .animation(.easeInOut, value: expanded4)
        .animation(.easeInOut, value: title)
        .animation(.easeInOut, value: subtitle)
        .animation(.easeInOut, value: expandedOptions)
        .animation(.easeInOut, value: collapsedOptions)
        .animation(.easeInOut, value: titleFont)
        .animation(.easeInOut, value: subtitleFont)
    }
}

extension Image {
    func centered() -> some View {
        GeometryReader { geo in
            self
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

// FIXME: Have to comment these out these previews when I have just the package open, otherwise it breaks the package previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
