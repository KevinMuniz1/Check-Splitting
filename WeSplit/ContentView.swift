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
    @FocusState private var isFocused: Bool
    
    private var finalAmount: Double {
        let numberOfPeople = Double(amountOfPeople + 2)
        let tipAmount = Double(tipPercentage)
        
        let tipValue = costOfCheck / 100 * tipAmount
        let grandTotal = costOfCheck + tipValue
        let amountPerPerson = grandTotal / numberOfPeople
        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
        var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Enter cost of check", value: $costOfCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Number of people", selection: $amountOfPeople){
                        ForEach(2..<17){
                            Text("\($0) people")
                        }
                    }
                }
                    Section("Select Tip Amount"){
                        Picker("Enter tip ammount", selection: $tipPercentage){
                            ForEach(tipPercentages, id: \.self){
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.segmented)
                    }
                Section("Final Amount") {
                    Text(finalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                }.navigationTitle("We Split")
                .toolbar {
                    if isFocused {
                        Button("Done"){
                            isFocused = false
                        }
                    }
                }
            }
        }
    }
#Preview {
    ContentView()
}
