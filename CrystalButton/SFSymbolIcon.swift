//
//  SFSymbolIcon.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

import SwiftUI

struct SFSymbolIcon: View {
    static let size = CGSize(width: 44, height: 44)

    var iconName: String
    var color: Color

    init(iconName: String, color: Color = .crystalForegroundDefault) {
        self.iconName = iconName
        self.color = color
    }

    var body: some View {
        Image(systemName: iconName)
            .renderingMode(.template)
            .font(.system(size: 24.0))
            .foregroundColor(color)
            .frame(
                width: SFSymbolIcon.size.height,
                height: SFSymbolIcon.size.height
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
