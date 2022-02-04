//
//  ArithmeticPracticeApp.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

@main
struct ArithmeticPracticeApp: App {
    
    // Create the source of truth for our list of questions (create view model)
    @StateObject private var store = QuestionStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
