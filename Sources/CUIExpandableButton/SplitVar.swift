//
// CUIExpandableButton
//
// MIT License
//
// Copyright (c) 2022 Robert Cole
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import SwiftUI

struct SplitVar<T> {
    @Binding
    var expanded: Bool

    var collapsedValue: T? = nil
    var expandedValue: T? = nil

    init(
        expanded: Binding<Bool>,
        _ value: T?,
        forState state: CUIExpandableButtonState = .any
    ) {
        _expanded = expanded
        setValue(value, forState: state)
    }

    var value: T? {
        if expanded {
            return expandedValue
        } else {
            return collapsedValue
        }
    }

    func withValue(_ value: T?, forState state: CUIExpandableButtonState) -> SplitVar<T> {
        var newVar = self

        newVar.setValue(value, forState: state)

        return newVar
    }

    mutating func setValue(_ value: T?, forState state: CUIExpandableButtonState) {
        if state.contains(.collapsed) {
            collapsedValue = value
        }

        if state.contains(.expanded) {
            expandedValue = value
        }
    }
}
