//
//  QuizView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct QuizView: View {
    
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
            
            // Show the buttons to control interface
            ZStack {
                
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
                
                // Button to allow user to check answer
                CheckAnswerView(currentQuestion: store.currentQuestion,
                                providedAnswer: $providedAnswer,
                                answerChecked: $answerChecked)
            }
            

            Spacer()
            

        }
    }
    
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(store: QuestionStore(questions: testData))
    }
}
