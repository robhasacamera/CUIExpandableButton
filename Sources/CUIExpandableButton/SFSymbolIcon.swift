//
//  SFSymbolIcon.swift
//  ButtonDemo
//
//  Created by Robert Cole on 7/22/22.
//

import SwiftUI

import SwiftUI

public struct SFSymbolIcon: View {var iconName: String
    public var body: some View {
        Image(systemName: iconName)
            .renderingMode(.template)
            .font(.title2)
    }
}

struct SFSymbolIcon_Previews: PreviewProvider {
    static var previews: some View {
        CenteredPreview{
            VStack {
                SFSymbolIcon(iconName: "rectangle.and.pencil.and.ellipsis")
                    .background(Color(.systemBackground))
                SFSymbolIcon(iconName: "gearshape.fill")
                    .foregroundColor(.yellow)
                    .background(Color(.systemBackground))
            }
        }
    }
}
