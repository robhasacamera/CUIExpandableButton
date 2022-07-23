//
//  Separator.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

struct Separator: View {
    enum Style: Identifiable, CaseIterable {
        case horizontal
        case vertical

        var id: Style { self }
    }

    var style: Style = .horizontal

    var body: some View {
        Rectangle()
            .frame(width: style == .vertical ? 1 : nil,
                   height: style == .horizontal ? 1 : nil)
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Separator.Style.allCases) { style in
            CenteredPreview(content: Separator(style: style))
        }
        ForEach(Separator.Style.allCases) { style in
            CenteredPreview(content: Separator(style: style))
                .foregroundColor(.yellow)
        }
    }
}
