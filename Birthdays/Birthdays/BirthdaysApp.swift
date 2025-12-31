//
//  BirthdaysApp.swift
//  Birthdays
//  https://developer.apple.com/tutorials/develop-in-swift/save-data
//  Created by Uri on 31/12/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
