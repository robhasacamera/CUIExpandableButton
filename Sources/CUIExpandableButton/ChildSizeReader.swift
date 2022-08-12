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
    let id: UUID
    let content: () -> Content

    var body: some View {
        content()
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self,
                                    value: [id: {
                                        print("proxy.size=\(proxy.size)")
                                        return proxy.size

                                    }()])
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { preferences in
                self.size = preferences[id] ?? .zero

                print("onPreferenceChange self.size=\(self.size), id=\(id) preferences=\(preferences)")
            }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = [UUID: CGSize]
    static var defaultValue: Value = [:]

    static func reduce(value: inout Value, nextValue: () -> Value) {
        let newValue = nextValue()

        for (key, size) in newValue {
            value[key] = size
        }

        print("reduce newValue=\(newValue), value=\(value)")
    }
}
