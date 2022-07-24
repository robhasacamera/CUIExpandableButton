//
//  ContentView.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

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
    var expanded5: Bool = true
    @State
    var expanded6: Bool = true
    @State
    var expanded7: Bool = true

    @State
    var textFieldString: String = "Compose here"
    @State
    var toggleBool1: Bool = true
    @State
    var toggleBool2: Bool = true
    @State
    var toggleBool3: Bool = true

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
                    expanded5 = false
                    expanded6 = false
                    expanded7 = false
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
                    .padding(.standardSpacing)

                } action: {
                    expanded1 = false
                    expanded3 = false
                    expanded4 = false
                    expanded5 = false
                    expanded6 = false
                    expanded7 = false
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
                        .padding(.standardSpacing)
                } action: {
                    expanded1 = false
                    expanded2 = false
                    expanded4 = false
                    expanded5 = false
                    expanded6 = false
                    expanded7 = false
                }
            }

            Spacer()

            CUIExpandableButton(
                expanded: $expanded4,
                sfSymbolName: "tag.fill",
                title: "Regular"
            ) {
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                print("tapped action and content")
            }

            CUIExpandableButton(
                expanded: $expanded5,
                sfSymbolName: "bell.fill",
                title: "Custom Color"
            ) {
                Text("The color can be customized using `foregroundColor()`.")
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                expanded1 = false
                expanded2 = false
                expanded3 = false
            }
            .foregroundColor(.yellow)

            CUIExpandableButton(
                expanded: $expanded6,
                sfSymbolName: "exclamationmark.triangle.fill",
                title: "Bolded"
            ) {
                Text("`fontWeight()` can be used to change the entire view.")
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                expanded1 = false
                expanded2 = false
                expanded3 = false
            }
            .fontWeight(.bold)

            // Not having this one close the others as a demo of content that doesn't need an action
            CUIExpandableButton(
                expanded: $expanded7,
                sfSymbolName: "flame.fill",
                title: "Close Button Hidden",
                hideCloseButton: true
            ) {
                Text("You can hide the close button and define your own close behavior.")
                    .frame(width: 200)
                    .padding(.standardSpacing)
                Button {
                    expanded7.toggle()
                } label: {
                    Text("Close")
                        .padding(.standardSpacing)
                }
            }

            Spacer()

            HStack {
                CUIExpandableButton(
                    sfSymbolName: "square.and.arrow.up"
                ) {
                    print("tapped action only")
                }

                CUIExpandableButton {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                } action: {
                    print("tapped action only")
                }
            }
        }
        .background(Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
        .animation(.easeInOut, value: expanded1)
        .animation(.easeInOut, value: expanded2)
        .animation(.easeInOut, value: expanded3)
        .animation(.easeInOut, value: expanded4)
        .animation(.easeInOut, value: expanded5)
        .animation(.easeInOut, value: expanded6)
        .animation(.easeInOut, value: expanded7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
