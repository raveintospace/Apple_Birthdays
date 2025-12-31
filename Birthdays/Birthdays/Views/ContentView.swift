//
//  ContentView.swift
//  Birthdays
//
//  Created by Uri on 31/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context

    @State private var newName: String = ""
    @State private var newDate: Date = Date.now

    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }

                    Text(friend.name)
                        .bold(friend.isBirthdayToday)

                    Spacer()

                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)

                    DatePicker(selection: $newDate,
                               in: Date.distantPast...Date.now,
                               displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                    }

                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)

                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            .task {
                context.insert(Friend(name: "Dani", birthday: .now))
                context.insert(Friend(name: "Larry", birthday: Date(timeIntervalSince1970: 0)))
                context.insert(Friend(name: "Oscar", birthday: Date(timeIntervalSince1970: 100000000)))
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
