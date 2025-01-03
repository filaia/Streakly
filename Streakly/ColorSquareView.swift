//
//  ColorSquareView.swift
//  Streakly
//
//  Created by Philip on 03.01.2025.
//

import SwiftUI

struct ColorSquareView: View {
    let color: Color
    let depth: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(depth == 0 ? .gray : color)
            .frame(width: 25, height: 25)
            .brightness(depth == 0 ? 0 : -Double(depth) * 0.1)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HStack {
        ForEach(0..<4) {
            ColorSquareView(color: .green, depth: $0)
        }
    }
}
