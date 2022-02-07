//
//  ContentView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView() {
            VStack() {
            HStack {
                Text("×")
                    .font(.system(size: 72))
                Spacer()
                VStack {
                    Text("5")
                        .font(.system(size: 72))
                    Text("6")
                        .font(.system(size: 72))
                }
                
            }
            Divider()
            HStack() {
                Spacer()
                Text("30")
                    .font(.system(size: 72))
            }
            Button(action: {
                // NOTE: Output will not be shown unless this app is run in the "full" simulator
                print("Button was pressed")
            }, label: {
                Text("New question")
                    .font(.system(size: 36))
            })
                    .buttonStyle(.bordered)
        }
            .padding()
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
