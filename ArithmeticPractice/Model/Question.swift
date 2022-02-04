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
struct Question {
    
    // MARK: Stored properties
    var multiplier: Int
    var multiplicand: Int
    var product: Int
    var state: QuestionState
    
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
}