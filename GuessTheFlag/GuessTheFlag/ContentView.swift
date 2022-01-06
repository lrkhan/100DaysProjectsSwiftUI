//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Luthfor Khan on 12/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var isTapped = false
    @State private var tappedFlag = -1
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var userScore = 0
    @State private var gamesPlayed = 1
    
    private var gameLimit = 3
    
    func FlagImage(country: String) -> some View {
        let img = Image(country).renderingMode(.original).clipShape(Capsule()).shadow(radius: 5)
        
        return img
    }
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button {
                            tappedFlag = number
                            flagTapped(number, country: countries[number])
                        } label: {
                            withAnimation{
                                FlagImage(country: countries[number])
                                    .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                            }
                        }
                        .rotation3DEffect(.degrees(number == self.tappedFlag ? animationAmount:0), axis: (x: 0, y: 1, z: 0))
                        .opacity(showingScore && (number != self.tappedFlag) ? 0.25 : 1)
                        .alert(scoreTitle, isPresented: $showingScore) {
                            if gamesPlayed < gameLimit {
                                Button("Continue", action:askQuestion)
                            } else {
                                Button("Restart Game?", action: resetGame)
                            }
                            
                        } message: {
                            if gamesPlayed < gameLimit {
                                Text("Your score is \(userScore)")
                            } else {
                                Text("Your final score is \(userScore)!")
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        gamesPlayed = 1
        userScore = 0
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        gamesPlayed += 1
        tappedFlag = -1
    }
    
    func flagTapped(_ number: Int, country: String) {
        withAnimation{
            animationAmount += 360
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(country)"
            if userScore > 0 {
                userScore -= 1
            }
        }
        
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
