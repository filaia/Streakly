//
//  HabitDay.swift
//  Streakly
//
//  Created by Philip on 03.01.2025.
//

import Foundation

struct HabitDay: Identifiable {
    let id = UUID()
    let date: Date
    var depth: Int
    
    // Generates an array of dates for the past year starting from today
    func generateYearDates() -> [Date] {
        let currentDate = Date()
        let daysInYear = 365
        return stride(from: 0, to: -daysInYear, by: -1).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: currentDate)
        }
    }
    
    static var mockData: [HabitDay] = {
        let habitDay = HabitDay(date: Date(), depth: 0)
        let yearDates = Array(habitDay.generateYearDates())
        return yearDates.map { date in
            HabitDay(date: date, depth: Int.random(in: 0...4))
        }
    }()
}
