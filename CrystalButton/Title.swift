//
//  Title.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct Title: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.cystalForegroundDefault)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview(content: Title(text: "A Shiny Title"))
    }
}
