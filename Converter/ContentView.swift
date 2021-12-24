//
//  ContentView.swift
//  Converter
//
//  Created by Ibrahim Abdul Aziz on 24/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = "0.0"
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    
    private let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedToCelsius: Double {
        var convertedInputToCelsius = 0.0
        
        if inputUnit == "Celsius" {
            convertedInputToCelsius = Double(inputNumber) ?? 0.0
        } else if inputUnit == "Fahrenheit" {
            convertedInputToCelsius = (convertedInputToCelsius - 32.0) * 5.0/9.0
        } else if inputUnit == "Kelvin" {
            convertedInputToCelsius = convertedInputToCelsius - 273.15
        }
        return convertedInputToCelsius
    }
    
    var conversionResult: Double {
        var convertedTemp = 0.0
        
        if outputUnit == inputUnit  {
            convertedTemp = Double(inputNumber) ?? 0.0
        }
        else if outputUnit == "Celsius" {
            convertedTemp = convertedToCelsius
        } else if outputUnit == "Fahrenheit" {
            convertedTemp = convertedToCelsius * 9.0 / 5.0 + 32.0
        } else if outputUnit == "Kelvin" {
            convertedTemp = convertedToCelsius + 273.15
        }
        return convertedTemp
    }
        
        
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Input:")) {
                    TextField("Value", text: $inputNumber)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(tempUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Convert to:")) {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(tempUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result:")) {
                    Text("\(conversionResult)")
                }
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.inline)
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
