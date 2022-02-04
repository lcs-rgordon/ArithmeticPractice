//
//  ContentView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Stores all the questions that the user has tried
    @ObservedObject var store: QuestionStore
    
    // The user's answer
    @State var providedAnswer: String = ""
    
    // This is toggled when an answer is checked
    @State var answerChecked: Bool = false
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Required so that UI updates when an answer is checked
            let _ = print("answerChecked was toggled: \(answerChecked)")
            
            // Show the question to be answered
            QuestionView(question: store.currentQuestion)
            
            // Allow user to enter an answer
            HStack {
                
                // Image shows a checkmark when correct, or an "x" when incorrect
                ResultView(currentQuestion: store.currentQuestion)
                
                // Accept input for and show an answer from the user
                AnswerView(currentQuestion: store.currentQuestion,
                           providedAnswer: $providedAnswer)
                
            }
            
            Button(action: {
                
                // Check the answer provided
                store.currentQuestion.check(providedAnswer)
                
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
                .opacity(store.currentQuestion.state == .unanswered ? 1.0 : 0.0)

            Spacer()
            

        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: QuestionStore(questions: testData))
    }
}
