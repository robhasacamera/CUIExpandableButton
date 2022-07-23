//
//  ContentView.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    @State
    var expanded0: Bool = false
    @State
    var expanded1: Bool = false
    @State
    var expanded2: Bool = false
    @State
    var expanded3: Bool = false

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                CrystalButton(expanded: $expanded0, iconName: "questionmark")
                CrystalButton(expanded: $expanded1, iconName: "questionmark") {
                    Text(LoremIpsum.words(50))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                }
                CrystalButton(expanded: $expanded2, iconName: "questionmark") {
                    Text(LoremIpsum.words(50))
                        .frame(width: 200)
                        .padding(.standardSpacing)
                } action: {
                    print("tapped action and content")
                }
                CrystalButton(expanded: $expanded3, iconName: "questionmark") {
                    print("tapped action only")
                }
            }
            .animation(.easeInOut, value: expanded1)
            .animation(.easeInOut, value: expanded2)

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
        ContentView()
    }
}
