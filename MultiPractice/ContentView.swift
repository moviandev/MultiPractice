//
//  ContentView.swift
//  MultiPractice
//
//  Created by Matheus Viana on 03/02/23.
//

import SwiftUI

struct Question {
    var multiplicant: Int
    var multiplicator: Int
    
    var product: Int {
        multiplicant * multiplicator
    }
    
    var question: String {
        "How much is... \(multiplicant) x \(multiplicator)"
    }
}

struct ContentView: View {
    @State private var rounds = 5
    @State private var table = 2
    @State private var questionNumber = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var questions: [Question] = []
    @State private var question = ""
    
    let roundsQuantity = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("MultiPractice")
                    .font(.largeTitle.bold())
                    .foregroundColor(.indigo)
                
                VStack(spacing: 15) {
                    Spacer()
                    
                    Text("Choose how many questions you want")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    
                    Picker("Questions", selection: $rounds) {
                        ForEach(roundsQuantity, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Spacer()
                    
                    Stepper("Choose the multiplication table", value: $table, in: 2...12)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    
                    
                    Text(question)
                    
                    HStack(spacing: 50) {
                        ForEach(0..<3) { question in
                            Button("\(questions[question].product)") {
                                validateAnswer(answer: question)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Text("Your current score \(score)")
                    
                }
            }
        }
        .padding()
        .onAppear(perform: startGame)
    }
    
    func validateAnswer(answer: Int) {
        if questions[questionNumber].product == questions[answer].product {
            score += 1
        } else {
            score -= score > 1 ? 1 : 0
        }
    }
    
    func startGame() {
        for _ in 0..<rounds {
            questions.append(Question(multiplicant: Int.random(in: 2...12), multiplicator: table))
        }
        
        question = questions[questionNumber].question
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
