//
//  ContentView.swift
//  MultiPractice
//
//  Created by Matheus Viana on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    @State private var questionsToBeAsked = 5
    @State private var randomNumber = Int.random(in: 1...12)
    @State private var answer = 0
    @State private var askedQuestions = [String: Bool]()
    
    let questions = [5, 10, 20]
    
    var body: some View {
        VStack {
            Text("Select the multiplication table you'd like to practice")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Stepper("Practice table of \(table)", value: $table, in: 2...12)
            
            Text("How many questions you'd like to practice")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Picker("Select questions", selection: $questionsToBeAsked) {
                ForEach(questions, id: \.self) {
                    Text($0, format: .number)
                }
            }
            .pickerStyle(.segmented)
            
            let questionAsked = "\(table) x \(randomNumber)"
            
            Text("How much is \(questionAsked)")
            
            TextField("Your answer", value: $answer, format: .number)
                .keyboardType(.numberPad)
                .onSubmit {
                    checkAnswer(questionAsked)
                }
        }
        .padding()
    }
    
    func checkAnswer(_ questionAsked: String) {
        askedQuestions[questionAsked] = answer % table == 0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
