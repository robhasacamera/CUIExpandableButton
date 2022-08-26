//
//  TitledGroup.swift
//  ButtonDemo
//
//  Created by Robert Cole on 8/21/22.
//

import CUIExpandableButton
import CUISeparator
import SwiftUI

struct TitledGroup<Content>: View where Content: View {
    var title: String
    var content: Content

    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack {
            HStack {
                CUISeparator()

                Text(title)
                    .font(.subheadline)
                    .fixedSize()

                CUISeparator()
            }

            content
        }
    }
}

struct TitledGroup_Previews: PreviewProvider {
    static var previews: some View {
        TitledGroup("Title") {
            Text("Some example content")
                .padding()
        }
    }
}
