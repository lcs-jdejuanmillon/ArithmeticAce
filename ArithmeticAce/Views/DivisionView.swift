//
//  DivisionView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-09.
//

import SwiftUI

struct DivisionView: View {
    // MARK: Stored properties augend addend
    @State var divisor = Int.random(in: 1...12)
    @State var quotient = Int.random(in: 1...12)
    @State var inputGiven = ""
    // Has an answer been checked?
    @State var answerChecked = false
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var dividend: Int {
        return  divisor * quotient
    }
    var body: some View {
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "÷",
                                     firstValue: dividend,
                                     secondValue: divisor)
            Divider()
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)
            ZStack{
                Button(action: {
                    // Answer has been checked!
                    answerChecked = true
                    // Convert the input given to an integer, if possible
                    guard let quotientGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }
                    // Check the answer!
                    if quotientGiven == quotient {
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
                Button(action: {
                    divisor = Int.random(in: 1...12)
                    quotient = Int.random(in: 1...12)
                    answerChecked = false
                    answerCorrect = false
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                //Only show this button when an answer has been check
                    .opacity(answerChecked ? 1.0 : 0.0)
            }
            // Reaction animation
            ZStack {
                LottieView(animationNamed: "51926-happy")
                    .padding()
                    .opacity(answerCorrect ? 1.0 : 0.0)
                LottieView(animationNamed: "84655-swinging-sad-emoji")
                    .padding()
                    .opacity(answerChecked && !answerCorrect ? 1.0 : 0.0)
            }
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}
