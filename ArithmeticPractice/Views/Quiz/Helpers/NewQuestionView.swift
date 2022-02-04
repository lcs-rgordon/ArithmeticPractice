//
//  NewQuestionView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct NewQuestionView: View {
    
    // MARK: Stored properties
    @ObservedObject var store: QuestionStore
    @Binding var providedAnswer: String
    
    // MARK: Computed properties
    var body: some View {
        
        // Button to allow the user to get a new question
        Button(action: {
            
            // Clear the old answer
            providedAnswer = ""
            
            // Generate a new question
            store.newQuestion()
            
        }, label: {
            Text("New question")
                .font(.largeTitle)
                .padding()
        })
            .buttonStyle(.bordered)
            .padding(.top)
            // Only show this button when a question has been answered
            .opacity(store.currentQuestion.state == .unanswered ? 0.0 : 1.0)

    }
}

struct NewQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NewQuestionView(store: QuestionStore(),
                        providedAnswer: .constant(""))
    }
}
