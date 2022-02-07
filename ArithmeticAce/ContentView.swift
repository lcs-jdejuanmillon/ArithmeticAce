//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored properties
    let multiplicand = Int.random(in: 1...12)
    let multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
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
                Spacer()
                TextField("", text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            Button(action: {
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    return
                }
                if productGiven == correctProduct {
                    // Celebrate
                } else {
                    // Sadness, tehy gave a number, but it's not correct
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
            Spacer()
        }
        .font(.system(size: 72))
        .padding(.horizontal)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
