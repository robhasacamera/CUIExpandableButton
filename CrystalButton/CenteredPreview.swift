//
//  CenteredPreview.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct CenteredPreview<Content>: View where Content: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                content

                Spacer()
            }

            Spacer()
        }
        .background(.gray)
    }
}

struct CenteredPreview_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview { Circle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
        }
    }
}
