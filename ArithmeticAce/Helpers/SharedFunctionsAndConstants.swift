//
//  SharedFunctionsAndConstants.swift
//  ArithmeticAce
//
//  Created by Jacobo de Juan Millon on 2022-02-24.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
let savedHistoryLabel =  "savedSum"
func persistHistory(operationNumber: Int) {
    let filename = getDocumentsDirectory().appendingPathComponent("History[\(operationNumber)]")
    print(filename)
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(History[operationNumber])
        try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        print("Saved data to the Documents directory successfully.")
        print("==========")
        print(String(data: data, encoding: .utf8)!)
    } catch {
        print("Unable to write list of favourites to the Documents directory")
        print("===========")
        print(error.localizedDescription)
    }
}
func loadHistory(operationNumber: Int) {
    let filename = getDocumentsDirectory().appendingPathComponent("History[\(operationNumber)]")
    print(filename)
    do {
        let data = try Data(contentsOf: filename)
        print("Saved data to the Documents directory successfully.")
        print("==========")
        print(String(data: data, encoding: .utf8)!)
        History[operationNumber] = try JSONDecoder().decode([Question].self, from: data)
    } catch {
        print("Could not load the data from the stored JSON file")
        print("========")
        print(error.localizedDescription)
    }
}
@State var History: [[Question]] = [
    [],
    [],
    [],
    []
]
