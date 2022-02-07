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
                // NOTE: Output will not be shown unless this app is run in the "full" simulator
                print("Button was pressed")
            }, label: {
                Text("New question")
                    .font(.system(size: 36))
            })
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
