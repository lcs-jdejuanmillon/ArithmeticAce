//
//  DivisionView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-09.
//

import SwiftUI

struct DivisionView: View {
    // MARK: Stored properties
    @Environment(\.scenePhase) var scenePhase
    @State var divisor = Int.random(in: 1...12)
    @State var correctQuotient = Int.random(in: 1...12)
    @State var inputGiven = ""
    @State var answerNotInt = false
    // Has an answer been checked?
    @State var answerChecked = false
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var dividend: Int {
        return  divisor * correctQuotient
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                QuestionPresentationView(operation: "÷",
                                         firstValue: dividend,
                                         secondValue: divisor)
                Divider()
                AnswerAndResultView(answerChecked: answerChecked,
                                    answerCorrect: answerCorrect,
                                    inputGiven: $inputGiven)
                ZStack{
                    CheckAnswerView(answerNotInt: $answerNotInt,
                                    answerChecked: $answerChecked,
                                    answerCorrect: $answerCorrect,
                                    question: "\(divisor) ÷ \(dividend) = \(correctQuotient)",
                                    inputGiven: inputGiven,
                                    correctAnswer: correctQuotient,
                                    operationNumber: 3)
                    Button(action: {
                        divisor = Int.random(in: 1...12)
                        correctQuotient = Int.random(in: 1...12)
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
                Text("The answer given was not an integer")
                    .opacity(answerNotInt ? 1.0 : 0.0)
                // Reaction animation
                AnimationsView(answerChecked: answerChecked,
                               answerCorrect: answerCorrect)
                List(History[3], id: \.self) { currentQuestion in
                    HStack {
                        Text(currentQuestion.text)
                        Spacer()
                        Image(systemName: currentQuestion.image)
                            .foregroundColor(currentQuestion.colour ? .green : .red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .font(.system(size: 72))
            .task {
                loadHistory(operationNumber: 3)
            }
        }
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}
