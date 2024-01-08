//
//  ContentView.swift
//  WeSplit
//
//  Created by Kevin Muniz on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var costOfCheck: Double = 0
    @State private var tipPercentage = 18
    @State private var amountOfPeople = 2
    @FocusState private var isFocused: Bool
    private var hasTipped: Bool {
        return tipPercentage != 0
    }
    
    private var amountPerPerson: Double {
        let numberOfPeople = Double(amountOfPeople + 2)
        let tipAmount = Double(tipPercentage)
        
        let tipValue = costOfCheck / 100 * tipAmount
        let grandTotal = costOfCheck + tipValue
        let amountPerPerson = grandTotal / numberOfPeople
        return amountPerPerson
    }
    private var totalAmount: Double {
        let tipAmount = Double(tipPercentage)
        let tipValue = costOfCheck / 100 * tipAmount
        let grandTotal = costOfCheck + tipValue
        return grandTotal
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
                            ForEach(0..<101){
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.navigationLink)
                    }
                Section("Total Bill Amount with tip") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(hasTipped ? .black : .red)
                }
                Section("Amount Per Person") {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
