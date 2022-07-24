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

    var body: some View {
        VStack(spacing: 8.0) {
            HStack(alignment: .top) {
                CUIExpandableButton(
                    expanded: $expanded1,
                    sfSymbolName: "pencil"
                ) {
                    Text(LoremIpsum.words(8))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                }

                CUIExpandableButton(
                    expanded: $expanded2,
                    sfSymbolName: "gearshape.fill",
                    title: "Information"
                ) {
                    Text(LoremIpsum.words(8))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action and content")
                }


                CUIExpandableButton(
                    expanded: $expanded3
                ) {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)

                } content: {
                    Text(LoremIpsum.words(8))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action only")
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
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                print("tapped action and content")
            }
            .foregroundColor(.yellow)

            CUIExpandableButton(
                expanded: $expanded6,
                sfSymbolName: "exclamationmark.triangle.fill",
                title: "Bolded"
            ) {
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                print("tapped action and content")
            }
            .fontWeight(.bold)

            CUIExpandableButton(
                expanded: $expanded7,
                sfSymbolName: "flame.fill",
                title: "Close Button Hidden",
                hideCloseButton: true
            ) {
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
                Button {
                    expanded7.toggle()
                } label: {
                    Text("Close")
                }
            } action: {
                print("tapped action and content")

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
