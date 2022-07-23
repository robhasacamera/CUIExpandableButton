//
//  SFSymbolIcon.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

import SwiftUI

struct SFSymbolIcon: View {
    @ScaledMetric(relativeTo: .title)
    var size: CGFloat = .icon

    var iconName: String
    var color: Color = .crystalForegroundDefault

    var body: some View {
        Image(systemName: iconName)
            .renderingMode(.template)
            .font(.title2)
            .foregroundColor(color)
            .frame(
                width: size,
                height: size
            )
    }
}

struct SFSymbolIcon_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview(content:
            VStack {
                SFSymbolIcon(iconName: "rectangle.and.pencil.and.ellipsis")
                    .background(Color(.systemBackground))
                SFSymbolIcon(iconName: "gearshape.fill", color: .yellow)
                    .background(Color(.systemBackground))
            })
    }
}
