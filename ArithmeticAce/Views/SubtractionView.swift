//
//  SubtractionView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct SubtractionView: View {
    // MARK: Stored properties
    @State var minuend = Int.random(in: 1...144)
    @State var subtrahend = 0
    @State var inputGiven = ""
    // Has an answer been checked?
    @State var answerChecked = false
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctDifference: Int {
        return minuend - subtrahend
    }
    var body: some View{
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "-",
                                     firstValue: minuend,
                                     secondValue: subtrahend)
            Divider()
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)
            ZStack{
                CheckAnswerView(answerChecked: $answerChecked,
                                answerCorrect: $answerCorrect,
                                inputGiven: inputGiven,
                                correctAnswer: correctDifference)
                Button(action: {
                    minuend = Int.random(in: 1...144)
                    subtrahend = Int.random(in: 1...minuend)
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
        // Closure (block of code) will run once when the view is loaded
        .task {
            subtrahend = Int.random(in: 1...minuend)
        }
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
