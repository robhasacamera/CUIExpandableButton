//
//  CloseButton.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

public struct CustomButtonStyle: ButtonStyle {
    let color: Color

    public init(color: Color = .crystalForegroundDefault) {
        self.color = color
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(color)
    }
}

struct CloseButton: View {
    // Consider making this a global type alias
    typealias Action = () -> Void

    @ScaledMetric(relativeTo: .title)
    var size: CGFloat = .icon

    var color: Color = .crystalForegroundDefault
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
        CenteredPreview(content: CloseButton(action: {}))
        CenteredPreview(content: CloseButton(action: {}))
            .foregroundColor(.yellow)
    }
}
