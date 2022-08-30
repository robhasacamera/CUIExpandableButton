//
//  SwiftUIView.swift
//  
//
//  Created by Robert Cole on 8/30/22.
//

import SwiftUI

/// Base protocol for CUIViews
public protocol CUIView: View {
    /// An action is a closure with no return type
    typealias Action = () -> Void
}
