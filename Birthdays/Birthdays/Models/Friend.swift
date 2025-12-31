//
//  Friend.swift
//  Birthdays
//
//  Created by Uri on 31/12/25.
//

import Foundation
import SwiftData

@Model
final class Friend {
    var name: String
    var birthday: Date

    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }

    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
