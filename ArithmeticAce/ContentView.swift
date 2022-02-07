//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("×")
                Spacer()
                VStack {
                    Text("5")
                    Text("6")
                }
            }
            Divider()
            HStack() {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                Spacer()
                Text("30")
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
