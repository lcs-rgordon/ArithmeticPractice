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
            
            TextField("", text: $providedAnswer)
                .font(.system(size: 72))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .padding(.trailing, 40)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: QuestionStore(questions: testData))
    }
}
