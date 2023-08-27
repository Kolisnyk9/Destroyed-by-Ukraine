//
//  Date+Extension.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import Foundation

extension Date {
    func daysBetween(_ dateFormatter: DateFormatter) -> Int {
        guard let startDate = dateFormatter.date(from: "2022-02-23") else { return 0}
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: self)
        return components.day ?? 0
    }
}
