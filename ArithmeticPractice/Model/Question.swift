//
//  Question.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import Foundation

// Enumerate possible states for a given question, once generated
enum QuestionState {
    case unanswered
    case correct
    case incorrect
}

// Store a single question presented to the user
class Question: Identifiable, ObservableObject {
    
    // MARK: Stored properties
    var id = UUID()
    var multiplier: Int
    var multiplicand: Int
    var product: Int
    @Published var state: QuestionState
    
    // MARK: Initializers
    // By default, random values are created, unless
    // arguments are provided for the parameters
    init(multiplier: Int = Int.random(in: 1...12),
         multiplicand: Int = Int.random(in: 1...12)) {
        
        // Initialize stored values
        self.multiplier = multiplier
        self.multiplicand = multiplicand
        self.product = multiplier * multiplicand
        self.state = .unanswered
        
    }
    
    // See whether the given input is the correct answer
    func check(_ input: String) -> Bool {
        
        // Attempt to convert the input to an Int
        guard let providedProduct = Int(input) else {
            
            // If the input cannot be made into an integer, it is definitely wrong
            state = .incorrect
            return false
        }
        
        // Check the answer
        if providedProduct == product {
            state = .correct
            return true
        } else {
            state = .incorrect
            return false
        }
        
    }

}
