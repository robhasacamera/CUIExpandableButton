//
//  NonDimmingButton.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/23/22.
//

import SwiftUI

struct NonDimmingButton<Label>: View where Label: View {
    @Namespace private var animation
    typealias Action = () -> ()

    let disabled: Bool
    let action: Action
    let label: Label

    internal init(
        disabled: Bool,
        action: @escaping Action,
        @ViewBuilder label: () -> Label
    ) {
        self.disabled = disabled
        self.action = action
        self.label = label()
    }

    var body: some View {
        ZStack {
            if disabled {
                label.matchedGeometryEffect(id: "label", in: animation)

            } else {
                Button(action: action, label: { label.matchedGeometryEffect(id: "label", in: animation) })
                    .buttonStyle(.plain)

            }
        }
        .animation(.easeInOut, value: disabled)

    }
}

struct NonDimmingButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()

            NonDimmingButton(disabled: false) {
                print("tapped")
            } label: {
                Text("Enabled Button Label")
            }

            Spacer()

            NonDimmingButton(disabled: true) {
                print("tapped")
            } label: {
                Text("Disabled Button Label")
            }

            Spacer()
        }
    }
}
