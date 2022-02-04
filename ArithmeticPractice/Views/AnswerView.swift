//
//  AnswerView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct AnswerView: View {
    
    // MARK: Stored properties
    @ObservedObject var currentQuestion: Question
    @Binding var providedAnswer: String
    
    // MARK: Computed properties
    var body: some View {
        
        // Accept input for and show an answer from the user
        ZStack {
            
            // Takes an answer from the user
            TextField("", text: $providedAnswer)
                .font(.system(size: 72))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .padding(.trailing, 40)
                // Once the question has been answered, hide this field
                .opacity(currentQuestion.state == .unanswered ? 1.0 : 0.0)
            
            // Show the answer the user gave (appears when the text field disappears)
            HStack {
                
                Spacer()
                
                Text(providedAnswer)
                    .font(.system(size: 72))
                    .padding(.trailing, 40)
            }
            // Once the question has been answered, show this text view
            .opacity(currentQuestion.state == .unanswered ? 0.0 : 1.0)

        }
        
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(currentQuestion: Question(), providedAnswer: .constant(""))
    }
}
