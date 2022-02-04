//
//  QuestionStore.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import Foundation

class QuestionStore: ObservableObject {
    
    // MARK: Stored properties
    
    // Stores the list of questions the user has completed
    @Published var questions: [Question]
    
    // Stores the current question being answered
    @Published var currentQuestion = Question()
    
    // MARK: Initializers
    // The list of questions will default to an empty list to begin unless a list is passed as an argument
    init(questions: [Question] = []) {
        
        // Initalize stored properties
        self.questions = questions
        
    }
    
}

// Create some test data to use with SwiftUI Previews
let testData = [
    Question(),
    Question(),
    Question(),
]
