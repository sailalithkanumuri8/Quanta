//
//  Date.swift
//  MyNCHS
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

// Basically finds out when the start day should be on the calendar
extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

// Capitalizes the first letter of the string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
