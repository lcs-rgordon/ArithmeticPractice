//
//  CheckAnswerView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct CheckAnswerView: View {
    
    // MARK: Stored properties
    @ObservedObject var currentQuestion: Question
    @Binding var providedAnswer: String
    @Binding var answerChecked: Bool

    // MARK: Computed properties
    var body: some View {
        
        // Button to allow user to check answer
        Button(action: {
            
            // Check the answer provided
            currentQuestion.check(providedAnswer)
            
            // Ensure the user interface gets updated
            answerChecked.toggle()
            
        }, label: {
            Text("Check answer")
                .font(.largeTitle)
                .padding()
        })
            .buttonStyle(.bordered)
            .padding(.top)
            // Once an answer is checked, hide this button
            .opacity(currentQuestion.state == .unanswered ? 1.0 : 0.0)
        
    }
}

struct CheckAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnswerView(currentQuestion: Question(),
                        providedAnswer: .constant(""),
                        answerChecked: .constant(false))
    }
}
