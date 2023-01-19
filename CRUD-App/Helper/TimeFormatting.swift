//
//  TimeFormatting.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 19/01/23.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hour = minutes/60
    let days = hour/24
    
    if minutes < 120 {
        return "\(minutes) minutes ago"
    } else if minutes >= 120 && hour < 48 {
        return "\(hour) hours ago"
    } else {
        return "\(days) days ago"
    }
}
