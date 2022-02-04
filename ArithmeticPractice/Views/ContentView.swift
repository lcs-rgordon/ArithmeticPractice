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
                Image(systemName: store.currentQuestion.state == .correct ? "checkmark.circle" : "x.square")
                    .resizable()
                    // Invisible when question is not answered
                    .opacity(store.currentQuestion.state == .unanswered ? 0.0 : 1.0)
                    // Green when correct, red when incorrect
                    .foregroundColor(store.currentQuestion.state == .correct ? Color.green : Color.red)
                    .frame(width: 50, height: 50)
                    .padding(.leading, 40)
                
                // Takes an answer from the user
                TextField("", text: $providedAnswer)
                    .font(.system(size: 72))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 40)
                    // Once the question has been answered, no more input is allowed
                    .disabled(store.currentQuestion.state != .unanswered)
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
    
    // MARK: Functions
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: QuestionStore(questions: testData))
    }
}
