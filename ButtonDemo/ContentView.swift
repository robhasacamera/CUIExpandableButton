//
//  ContentView.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    init(expanded: Bool = false) {
        expanded4 = expanded
    }

    @State
    var expanded0: Bool = false
    @State
    var expanded1: Bool = false
    @State
    var expanded2: Bool = false
    @State
    var expanded3: Bool = false
    @State
    var expanded4: Bool

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                CrystalExpandableButton(
                    expanded: $expanded0,
                    iconName: "questionmark"
                )
                CrystalExpandableButton(
                    expanded: $expanded1,
                    iconName: "questionmark"
                ) {
                    Text(LoremIpsum.words(50))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                }
                CrystalExpandableButton(
                    expanded: $expanded2,
                    iconName: "questionmark"
                ) {
                    Text(LoremIpsum.words(50))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action and content")
                }
                CrystalExpandableButton(
                    expanded: $expanded3,
                    iconName: "questionmark"
                ) {
                    print("tapped action only")
                }
                CrystalExpandableButton(
                    expanded: $expanded4,
                    iconName: "questionmark",
                    title: "Information",
                    color: .yellow
                ) {
                    Text(LoremIpsum.words(50))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action and content")
                }
            }
            .animation(.easeInOut, value: expanded1)
            .animation(.easeInOut, value: expanded2)
            .animation(.easeInOut, value: expanded4)

            Spacer()
        }
        .background(Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(expanded: false)
        ContentView(expanded: true)
    }
}
