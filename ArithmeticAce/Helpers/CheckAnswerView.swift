//
//  CheckAnswerView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-14.
//

import SwiftUI

struct CheckAnswerView: View {
    // MARK: Stored properties
    @Binding var answerNotInt: Bool
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    let question: String
    let inputGiven: String
    let correctAnswer: Int
    let operationNumber: Int
    // MARK: Computed properties
    var body: some View {
        Button(action: {
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerNotInt = true
                return
            }
            // Answer has been checked!
            answerChecked = true
            // Check the answer!
            if answerGiven == correctAnswer {
                // Celebrate! 👍🏼
                answerCorrect = true
                // Answer has been checked!
                History[operationNumber].append(Question(text: question, image: "checkmark.circle", colour: true))
            } else {
                // Sadness, they gave a number, but it's correct 😭
                answerCorrect = false
                History[operationNumber].append(Question(text: "\(question) (\(inputGiven))", image: "x.circle", colour: false))
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
        CheckAnswerView(answerNotInt: .constant(false),
                        answerChecked: .constant(false),
                        answerCorrect: .constant(false),
                        question: "",
                        inputGiven: "8",
                        correctAnswer: 6,
                        operationNumber: 0)
    }
}
