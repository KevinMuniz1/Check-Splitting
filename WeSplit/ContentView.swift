//
//  ContentView.swift
//  WeSplit
//
//  Created by Kevin Muniz on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var costOfCheck: Double = 0
    @State private var tipPercentage = 0
    @State private var amountOfPeople = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Enter cost of check", value: $costOfCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $amountOfPeople){
                        ForEach(2..<17){
                            Text("\($0) people")
                        }
                    }
                    Picker("Enter tip ammount", selection: $tipPercentage){
                        
                    }
                }
            }.navigationTitle("We Split")
        }
    }
}
#Preview {
    ContentView()
}
