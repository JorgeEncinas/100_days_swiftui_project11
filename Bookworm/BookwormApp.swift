//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/21/25.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
