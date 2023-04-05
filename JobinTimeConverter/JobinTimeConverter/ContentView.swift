//
//  ContentView.swift
//  JobinTimeConverter
//
//  Created by Ton Silva on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromTimeType: String  = "Seconds"
    @State private var fromTimeInput: Int = 0
    @State private var toTimeType: String = "Hours"
    @FocusState private var inputIsFocused: Bool
    
    
    var timeConverted: Int {
        switch (fromTimeType, toTimeType) {
        case ("Seconds", "Seconds"):
            return fromTimeInput
        case("Seconds", "Minutes"):
            return fromTimeInput / 60
        case("Seconds","Hours"):
            return fromTimeInput / 60 / 60
        case("Seconds","Days"):
            return fromTimeInput / 60 / 60 / 24
        case("Minutes","Seconds"):
            return fromTimeInput * 60
        case("Minutes","Minutes"):
            return fromTimeInput
        case("Minutes","Hours"):
            return fromTimeInput / 60
        case("Minutes","Days"):
            return fromTimeInput / 60 / 24
        case("Hours","Seconds"):
            return fromTimeInput * 60 * 60
        case("Hours","Minutes"):
            return fromTimeInput * 60
        case("Hours","Hours"):
            return fromTimeInput
        case("Hours","Days"):
            return fromTimeInput / 24
        case("Days","Seconds"):
            return fromTimeInput * 24 * 60 * 60
        case("Days","Minutes"):
            return fromTimeInput * 24 * 60
        case("Days","Hours"):
            return fromTimeInput * 24
        case("Days","Days"):
            return fromTimeInput
        default:
            return 0
        }
    }
    
    let timeTypes = ["Seconds", "Minutes", "Hours","Days"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From:", selection: $fromTimeType) {
                        ForEach(timeTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    TextField("Value",
                              value: $fromTimeInput,
                              format: .number.rounded())
                }
                .keyboardType(.numberPad)
                .focused($inputIsFocused)
                
                Section {
                    Picker("To:", selection: $toTimeType) {
                        ForEach(timeTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Text(timeConverted,
                         format: .number.rounded())
                }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


