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
    @State private var attempts: Int = 0
    @State private var showDialog = false
    @State private var buttonClicked: Bool = false
    @State private var score: Int = 0
    @State private var showResult: Bool = false
    @State private var answerCorrect: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing:70) {
                Text("Attempts: \(attempts)")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(width: 200, height: 70)
                    .background(Color.white)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                
                Text("\(randomNumber)")
                    .opacity(randomNumber > 1 ? 1 : 0)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .frame(width: 200, height: 70)
                    .background(Color.white)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                
                Button (action: {
                    buttonClicked = true
                    if isPrime(randomNumber) {
                        score += 1
                        answerCorrect = true
                    }
                    else {
                        answerCorrect = false
                    }
                    })
                {
                    Text("Prime")
                        .padding()
                        .font(.system(size: 40))
                        .frame(width: 160, height: 70)
                        .background(Color.white)
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }.disabled(buttonClicked)
                
                Button (action:{
                    buttonClicked = true
                    if !isPrime(randomNumber) {
                        score += 1
                        answerCorrect = true
                    }
                    else {
                        answerCorrect = false
                    }
                })
                {
                    Text("non Prime")
                        .padding()
                        .font(.system(size: 40))
                        .frame(width: 260, height: 70)
                        .background(Color.white)
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }.disabled(buttonClicked)
                
                if showResult || buttonClicked {
                    Image(systemName: answerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(answerCorrect ? .green : .red)
                        .font(.largeTitle)
                }

            }
            .padding()
            .onAppear {
                startTimer()
            }
            
            if showDialog {
                VStack {
                    Text("Your results")
                        .font(.title)
                        .padding()
                    
                    Text("Score: \(score) out of 10")
                        .padding()
                    
                    Button("OK") {
                        withAnimation {
                            randomNumber = -1
                            showDialog = false
                            attempts = 0
                            buttonClicked = false
                            answerCorrect = false
                            score = 0
                        }
                    }
                    .padding()
                }
                .frame(width: 300, height: 200)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
                .transition(.opacity)
                .zIndex(1)
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
        if attempts == 10 {
            showDialog = true
            return -1
        }
        if attempts > 0 {
            showResult = true
        }
        if(attempts > 0 && !buttonClicked){
            answerCorrect=false
        }
        buttonClicked = false
        attempts += 1
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
