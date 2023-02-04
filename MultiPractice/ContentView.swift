//
//  ContentView.swift
//  MultiPractice
//
//  Created by Matheus Viana on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    @State private var questions = 0
    
    var body: some View {
        VStack {
            Text("Which table you'd like to practice today")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Stepper("Select table", value: $table, in: 2...12)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
