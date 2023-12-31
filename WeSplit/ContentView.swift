//
//  ContentView.swift
//  WeSplit
//
//  Created by Kevin Muniz on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var costOfCheck: Double = 0
    @State private var tipPercentage: Double = 0
    @State private var amountOfPeople: Double = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section{
                TextField("Enter cost of check", value: $costOfCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            Section{
                Text(costOfCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}
#Preview {
    ContentView()
}
