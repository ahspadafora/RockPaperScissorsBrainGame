//
//  ContentView.swift
//  RPS
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var kindOfHand: String {
        return playerShouldWin ? "winning" : "losing"
    }
    var hands: [String] = ["rock", "paper", "scissors"]
    var winningHands: [String: String] = [
        "rock": "paper",
        "scissors": "rock",
        "paper": "scissors"]
    
    @State private var score = 0
    @State private var computersHand = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    
    func resetGame() {
        self.computersHand = Int.random(in: 0...2)
        self.score = 0
    }
    
    func checkAnswer(computersHand: String, chosenHand: String, playerShouldWin: Bool) {
        
        guard let winningHand = winningHands[computersHand] else { return }
        switch playerShouldWin {
        case true:
            score = (chosenHand == winningHand) ? score + 1 : score - 1
        case false:
            score = (chosenHand == winningHand) ? score - 1 : score + 1
        }
        self.computersHand = Int.random(in: 0...2)
        self.playerShouldWin = Bool.random()
        
    }
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack() {
                    Spacer()
                    VStack(alignment: .center) {
                        Button(action:{
                            self.resetGame()
                        }) {
                            Image("reset").renderingMode(.original)
                        }
                        Text("New Game")
                        Text("Score: \(score)")
                    }.offset(CGSize(width: -10, height: 0))
                }.padding()
                
                Text("Computer's move: \(hands[computersHand])").whiteButtonStyle()
                
                HandButtonImage(handImageString: hands[computersHand])
                
                Spacer()
                
                HStack(spacing: 5.0) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            //print("player selected \(self.hands[number])")
                            self.checkAnswer(computersHand: self.hands[self.computersHand], chosenHand: self.hands[number], playerShouldWin: self.playerShouldWin)
                        }) {
                            HandButtonImage(handImageString: self.hands[number])
                        }
                    }
                }.padding()
                Text("Choose a \(kindOfHand) hand").whiteButtonStyle()
                Spacer()
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
