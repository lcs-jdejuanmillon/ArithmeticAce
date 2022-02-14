//
//  MultiplicationView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct MultiplicationView: View {
    // MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplicator = Int.random(in: 1...12)
    @State var inputGiven = ""
    // Has an answer been checked?
    @State var answerChecked = false
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplicator
    }
    var body: some View{
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "×",
                                     firstValue: multiplicand,
                                     secondValue: multiplicator)
            Divider()
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)
            ZStack{
                CheckAnswerView(answerChecked: $answerChecked,
                                answerCorrect: $answerCorrect,
                                inputGiven: inputGiven,
                                correctAnswer: correctProduct)
                Button(action: {
                    multiplicand = Int.random(in: 1...12)
                    multiplicator = Int.random(in: 1...12)
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
            AnimationsView(answerChecked: answerChecked,
                           answerCorrect: answerCorrect)
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
