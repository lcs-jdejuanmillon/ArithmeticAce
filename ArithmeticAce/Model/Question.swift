//
//  Question.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-24.
//

import Foundation
import SwiftUI

struct Question: Decodable, Hashable, Encodable {
    var text: String
    var image: String
    var colour: Bool
}
