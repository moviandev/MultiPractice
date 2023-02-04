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
        "\(multiplicant) x \(multiplicator)"
    }
}

struct ContentView: View {
    @State private var rounds = 5
    @State private var table = 2
    @State private var questionNumber = Int.random(in: 0..<2)
    
    var questions: [Question] {
        generateQuestions(rounds: rounds, table: table).shuffled()
    }
    
    let roundsQuantity = [5, 10, 20]
    
    var body: some View {
        VStack {
        }
        .padding()
    }
    
    func generateQuestions(rounds: Int, table: Int) -> [Question] {
        var questions = [Question]()
        
        for _ in 0..<rounds {
            questions.append(Question(multiplicant: Int.random(in: 2...12), multiplicator: table))
        }
        
        return questions
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
