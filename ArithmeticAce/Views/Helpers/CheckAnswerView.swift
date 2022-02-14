//
//  CheckAnswerView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-14.
//

import SwiftUI

struct CheckAnswerView: View {
    // MARK: Stored properties
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    let inputGiven: String
    let correctAnswer: Int
    
    // MARK: Computed properties
    var body: some View {
        Button(action: {
            // Answer has been checked!
            answerChecked = true
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerCorrect = false
                return
            }
            // Check the answer!
            if answerGiven == correctAnswer {
                // Celebrate! 👍🏼
                answerCorrect = true
            } else {
                // Sadness, they gave a number, but it's correct 😭
                answerCorrect = false
            }
        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
        //Only show when this buttom when an answer has not been check
            .opacity(answerChecked ? 0.0 : 1.0)
            .padding()
            .buttonStyle(.bordered)
    }
}

struct CheckAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnswerView(answerChecked: .constant(false),
                        answerCorrect: .constant(false),
                        inputGiven: "8",
                        correctAnswer: 6)
    }
}
