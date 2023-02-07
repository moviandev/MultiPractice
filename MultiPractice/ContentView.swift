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
        "What is... \(multiplicant) x \(multiplicator)"
    }
}

struct ContentView: View {
    @State private var rounds = 5
    @State private var table = 2
    @State private var questionNumber = Int.random(in: 0...2)
    @State private var score = 0
    @State private var answer = 0
    @State private var playedRounds = 0
    @State private var showingEndGame = false
    
    @State private var questions: [Question] = []
    @State private var question = ""
    
    let roundsQuantity = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Text("MultiPractice")
                    .font(.largeTitle.bold())
                    .foregroundColor(.indigo)

                VStack(spacing: 50) {
                    Text("Choose how many questions you want")
                        .foregroundColor(.secondary)
                        .font(.subheadline)

                    Picker("Questions", selection: $rounds) {
                        ForEach(roundsQuantity, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)

                    Stepper("Current table \(table)", value: $table, in: 2...12)
                        .foregroundColor(.secondary)
                        .font(.subheadline)


                    Text(question)

                    TextField("Your answer", value: $answer, format: .number)
                        .onSubmit {
                            validateAnswer(answer: answer)
                        }

                    Spacer()

                    Text("Your current score \(score)")

                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Practice Again") {
                        startGame()
                    }
                }
            }
        }

        .padding()
        .onAppear(perform: startGame)
    }
    
    func validateAnswer(answer: Int) {
        if questions[questionNumber].product == answer {
            score += 1
        }
        
        playedRounds += 1
        
        if playedRounds == rounds {
            showingEndGame = true
        }
        
        askNewQuestion()
    }
    
    func startGame() {
        if questions.count > 0 {
            questions.removeAll()
        }
        
        for _ in 0..<rounds {
            questions.append(Question(multiplicant: Int.random(in: 2...12), multiplicator: table))
        }
        
        question = questions[questionNumber].question
    }
    
    func askNewQuestion() {
        questions.shuffle()
        questionNumber = Int.random(in: 0...2)
        question = questions[questionNumber].question
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
