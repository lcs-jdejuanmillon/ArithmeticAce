//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct MultiplicationView: View {
    
    //MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    @State var feedback = ""
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("×")
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
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
                // Answer has been checked!
                answerChecked = true
                //Conver the input given to an integer, if possible
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    answerCorrect = false
                    feedback = "Input is invalid."
                    return
                }
                answerChecked = true
                if productGiven == correctProduct {
                    // Celebrate
                    answerCorrect = true
                    feedback = "The answer is correct!"
                } else {
                    // Sadness, tehy gave a number, but it's not correct
                    answerCorrect = false
                    feedback = "The correct answer was \(correctProduct)"
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
                multiplicand = Int.random(in: 1...12)
                multiplier = Int.random(in: 1...12)
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
struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MultiplicationView()
        }
    }
}
