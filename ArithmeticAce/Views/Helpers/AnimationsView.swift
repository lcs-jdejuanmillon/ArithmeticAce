//
//  AnimationsView.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-14.
//

import SwiftUI

struct AnimationsView: View {
    // MARK: Stored properties
    let answerChecked: Bool
    let answerCorrect: Bool
    
    //MARK: Computed properties
    var body: some View {
        ZStack {
            LottieView(animationNamed: "51926-happy")
                .padding()
                .opacity(answerCorrect ? 1.0 : 0.0)
            LottieView(animationNamed: "84655-swinging-sad-emoji")
                .padding()
                .opacity(answerChecked && !answerCorrect ? 1.0 : 0.0)
        }
    }
}

struct AnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsView(answerChecked: true,
                       answerCorrect: true)
    }
}
