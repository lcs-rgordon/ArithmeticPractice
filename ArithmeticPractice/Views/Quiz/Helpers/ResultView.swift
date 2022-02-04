//
//  ResultView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: Stored properties
    @ObservedObject var currentQuestion: Question
    
    // MARK: Computed properties
    var body: some View {
        // Image shows a checkmark when correct, or an "x" when incorrect
        Image(systemName: currentQuestion.state == .correct ? "checkmark.circle" : "x.square")
            .resizable()
            // Invisible when question is not answered
            .opacity(currentQuestion.state == .unanswered ? 0.0 : 1.0)
            // Green when correct, red when incorrect
            .foregroundColor(currentQuestion.state == .correct ? Color.green : Color.red)
            .frame(width: 50, height: 50)
            .padding(.leading, 40)

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(currentQuestion: Question())
    }
}
