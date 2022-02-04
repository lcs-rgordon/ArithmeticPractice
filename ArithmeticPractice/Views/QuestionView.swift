//
//  QuestionView.swift
//  ArithmeticPractice
//
//  Created by Russell Gordon on 2022-02-04.
//

import SwiftUI

struct QuestionView: View {
    
    // MARK: Stored properties
    var question: Question
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                VStack {
                    Text("×")
                }
                VStack {
                    HStack {
                        Spacer()
                        Text("\(question.multiplier)")
                    }
                    HStack {
                        Spacer()
                        Text("\(question.multiplicand)")
                    }
                }
            }
            .font(.system(size: 72))
            .padding(.horizontal, 25)
            .padding(.top, 50)
            
            Divider()
                .background(.primary)

            Spacer()
            
        }
        .padding(.horizontal)

    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question())
    }
}
