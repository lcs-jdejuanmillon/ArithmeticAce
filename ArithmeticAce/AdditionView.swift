//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct AdditionView: View {
    @State var number1 = Int.random(in: 1...12)
    @State var number2 = Int.random(in: 1...12)
    @State var inputGiven = ""
    @State var feedback = ""
    @State var answerChecked = false
    @State var answerCorrect = false
    
    var correctSum: Int {
        return number1 + number2
    }
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("+")
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(number1)")
                    Text("\(number2)")
                }
            }
            Divider()
            HStack() {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .opacity(answerCorrect ? 1 : 0)
                Spacer()
                TextField("", text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            Button(action: {
                answerChecked = true
                guard let sumGiven = Int(inputGiven) else {
                    answerCorrect = false
                    feedback = "Input is invalid."
                    return
                }
                answerChecked = true
                if sumGiven == correctSum {
                    answerCorrect = true
                    feedback = "The answer is correct!"
                } else {
                    answerCorrect = false
                    feedback = "The correct answer was \(correctSum)"
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
            Text(feedback)
                .opacity(answerChecked ? 1 : 0)
                .font(.largeTitle)
            Button(action: {
                answerChecked = false
                answerCorrect = false
                number1 = Int.random(in: 1...12)
                number2 = Int.random(in: 1...12)
            }, label: {
                Text("New Question")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
                .opacity(answerChecked ? 1 : 0)
            Spacer()
        }
        .font(.system(size: 72))
        .padding(.horizontal)
    }
}
struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdditionView()
        }
    }
}
