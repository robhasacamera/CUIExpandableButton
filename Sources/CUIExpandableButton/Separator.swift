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
            CenteredPreview {
                Separator(style: style)
            }
        }
        ForEach(Separator.Style.allCases) { style in
            CenteredPreview {
                Separator(style: style)
                    .foregroundColor(.yellow)
            }
        }
    }
}
