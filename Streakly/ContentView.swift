//
//  ContentView.swift
//  Streakly
//
//  Created by Philip on 01.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var habitDays = HabitDay.mockData
    @State private var position = ScrollPosition(edge: .leading)
    
    private let daysOfWeek = 7
    
    private var rows: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 4), count: daysOfWeek)
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 4) {
                    ForEach(habitDays) {
                        ColorSquareView(color: .green, depth: $0.depth)
                    }
                }
            }
            .frame(height: 200)
            .scrollPosition($position)
            .onAppear {
                position.scrollTo(edge: .trailing)
            }
            Spacer()
        }
        .padding([.top, .bottom])
    }
}

#Preview {
    ContentView()
}
