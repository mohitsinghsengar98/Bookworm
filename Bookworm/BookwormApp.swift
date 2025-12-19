//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mohit Sengar on 17/12/25.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Book.self)
    }
}
