//
//  File.swift
//
//
//  Created by Robert Cole on 7/30/22.
//

import SwiftUI

// From: https://stackoverflow.com/a/60861575/898984
struct ChildSizeReader<Content: View>: View {
    @Binding var size: CGSize
    let content: () -> Content
    var body: some View {
        ZStack {
            content()
                .frame(width: size != .zero ? ceil(size.width) : nil,
                       height: size != .zero ? ceil(size.height) : nil)
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: SizePreferenceKey.self,
                                        value: proxy.size)
                    }
                )
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size = preferences
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}
