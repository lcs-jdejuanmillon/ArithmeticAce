//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI
import Lottie

struct AdditionView: View {
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...143)
    @State var addend = 0
    @State var inputGiven = ""
    // Has an answer been checked?
    @State var answerChecked = false
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctSum: Int {
        return augend + addend
    }
    var body: some View{
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "+",
                                     firstValue: augend,
                                     secondValue: addend)
            Divider()
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)
            ZStack{
                CheckAnswerView(answerChecked: $answerChecked,
                                answerCorrect: $answerCorrect,
                                inputGiven: inputGiven,
                                correctAnswer: correctSum)
                Button(action: {
                    augend = Int.random(in: 1...143)
                    addend = Int.random(in: 1...144-augend)
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
        .task {
            addend = Int.random(in: 1...144-augend)
        }
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
