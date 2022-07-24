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

    @ScaledMetric(relativeTo: .title)
    var size: CGFloat = .icon
    let action: Action

    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.headline)
                .frame(width: size, height: size)
        }
        .buttonStyle(.plain)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview {
            VStack {
                CloseButton(action: {})
                CloseButton(action: {})
                    .foregroundColor(.yellow)
            }
        }
    }
}
