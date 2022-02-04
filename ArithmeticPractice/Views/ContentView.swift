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
    
    // The question currently being shown
    @StateObject var currentQuestion = Question()
    
    // The user's answer
    @State var providedAnswer: String = ""
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            QuestionView(question: currentQuestion)
            
            HStack {
                
                // Image shows a checkmark when correct, or an "x" when incorrect
                Image(systemName: currentQuestion.state == .correct ? "checkmark.circle" : "x.square")
                    .resizable()
                    // Invisible when question is not answered
                    .opacity(currentQuestion.state == .unanswered ? 0.0 : 1.0)
                    // Green when correct, red when incorrect
                    .foregroundColor(currentQuestion.state == .correct ? Color.green : Color.red)
                    .frame(width: 50, height: 50)
                    .padding(.leading, 40)
                
                TextField("", text: $providedAnswer)
                    .font(.system(size: 72))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 40)
            }
            
            Button(action: {
                
                // Check the answer provided
                let result = currentQuestion.check(providedAnswer)
                
                print("Was answer correct? \(result)")
                
            }, label: {
                Text("Check answer")
                    .font(.largeTitle)
                    .padding()
            })
                .buttonStyle(.bordered)
                .padding(.top)

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
