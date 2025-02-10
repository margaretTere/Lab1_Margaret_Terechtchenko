//
//  ContentView.swift
//  Lab1_Margaret_Terechtchenko
//
// By: Margaret Terechtchenko 101297977
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber: Int = -1
    @State private var timer: Timer? = nil
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
                
                Text("Prime")
                    .padding()
                    .font(.system(size: 40))
                    .frame(width: 160, height: 70)
                    .background(Color.white)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                
                
                Text("non Prime")
                    .padding()
                    .font(.system(size: 40))
                    .frame(width: 260, height: 70)
                    .background(Color.white)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                
            }
            .padding()
            .onAppear {
                startTimer()
            }
        }
    }
    
    func startTimer() {
            stopTimer()
            timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                fillNumber()
            }
    }

    func fillNumber() {
            randomNumber = generateNewNumber()
    }

    func stopTimer() {
            timer?.invalidate()
            timer = nil
    }

    func generateNewNumber() -> Int{
        return Int.random(in: 1...100)
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
