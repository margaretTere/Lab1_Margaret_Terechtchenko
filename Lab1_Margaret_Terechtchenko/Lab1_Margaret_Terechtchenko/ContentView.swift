//
//  ContentView.swift
//  Lab1_Margaret_Terechtchenko
//
// By: Margaret Terechtchenko 101297977
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber: Int = -1
    var body: some View {
        ZStack {
            VStack {
                
                Text("\(randomNumber)")
                      .font(.system(size: 50))
                      .fontWeight(.bold)
                      .frame(width: 200, height: 70)
                      .background(Color.white)
                      .foregroundColor(.green)
                      .cornerRadius(10)
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .onAppear {
                generateNewNumber()
            }
        }
    }
    
    func generateNewNumber(){
         randomNumber = Int.random(in: 1...100)
     }
}

func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }

    return true
}

#Preview {
    ContentView()
}
