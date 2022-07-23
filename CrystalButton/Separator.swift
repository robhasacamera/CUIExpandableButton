//
//  Separator.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct Separator: View {
    enum Style: Identifiable, CaseIterable {
        case paddedHorizontal
        case horizontal
        case vertical

        var id: Style { self }
    }

    var style: Style = .paddedHorizontal

    var body: some View {
        Rectangle()
            .foregroundColor(.cystalForegroundDefault)
            .frame(width: style == .vertical ? 1 : nil,
                   height: style == .paddedHorizontal || style == .horizontal ? 1 : nil)
            .padding(.horizontal, style == .paddedHorizontal ? 22 : 0)
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Separator.Style.allCases) { style in
            CenteredPreview(content: Separator(style: style))
        }
    }
}
