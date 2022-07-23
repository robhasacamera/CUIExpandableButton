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
                    sfSymbolName: "questionmark"
                ) {
                    Text(LoremIpsum.words(8))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                }

                CUIExpandableButton(
                    expanded: $expanded2,
                    sfSymbolName: "questionmark",
                    title: "Information"
                ) {
                    Text(LoremIpsum.words(8))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action and content")
                }

                CUIExpandableButton(
                    sfSymbolName: "questionmark"
                ) {
                    print("tapped action only")
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

                CUIExpandableButton {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                } action: {
                    print("tapped action only")
                }
            }

            CUIExpandableButton(
                expanded: $expanded4,
                sfSymbolName: "questionmark",
                title: "Information"
            ) {
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                print("tapped action and content")
            }

            CUIExpandableButton(
                expanded: $expanded5,
                sfSymbolName: "questionmark",
                title: "Information"
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
                sfSymbolName: "questionmark",
                title: "Information"
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
                sfSymbolName: "questionmark",
                title: "Information",
                hideCloseButton: true
            ) {
                Text(LoremIpsum.words(8))
                    .frame(width: 200)
                    .padding(.standardSpacing)
            } action: {
                print("tapped action and content")
            }

            Spacer()
        }
        .animation(.easeInOut, value: expanded1)
        .animation(.easeInOut, value: expanded2)
        .animation(.easeInOut, value: expanded3)
        .animation(.easeInOut, value: expanded4)
        .animation(.easeInOut, value: expanded5)
        .animation(.easeInOut, value: expanded6)
        .animation(.easeInOut, value: expanded7)
        .background(Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
