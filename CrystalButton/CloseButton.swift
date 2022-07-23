//
//  CloseButton.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct CloseButton: View {
    // Consider making this a global type alias
    typealias Action = () -> Void

    var color: Color = .crystalForegroundDefault
    let action: Action

    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.system(size: 18))
                .foregroundColor(color)
                .frame(width: .icon, height: .icon)
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview(content: CloseButton(action: {}))
        CenteredPreview(content: CloseButton(color: .yellow, action: {}))
    }
}
