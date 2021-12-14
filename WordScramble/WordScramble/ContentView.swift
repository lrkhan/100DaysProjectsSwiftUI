//
//  ContentView.swift
//  WordScramble
//
//  Created by Luthfor Khan on 12/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords: [String] = []
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List{
                Section{
                    TextField("Enter Your Word:", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section("Score"){
                    HStack{
                        Spacer()
                        Text("\(score) points")
                        Spacer()
                    }
                }
                
                Section{
                    ForEach(usedWords, id: \.self){ word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                Button("New Word", action: newGame)
            }
            .onSubmit {
                addNewWord()
            }
            .onAppear(perform: startGame)
            .alert(errorTitle ,isPresented: $showingError) {
                Button("OK", role: .cancel){}
            }  message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let ans = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard ans.count > 2 else {
            wordError(title: "Word is too short", message: "Has to be 3 characters or more")
            return }
        
        guard isOriginal(word: ans) else {
            wordError(title: "Word Used Already", message: "Read More")
            return
        }
        
        guard isPossible(word: ans) else {
            wordError(title: "Word Not Possible", message: "Cannot be spelled from '\(rootWord)'")
            return
        }
        
        guard isReal(word: ans) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        // adds an small animation to the word
        withAnimation {
            score += newWord.count
            usedWords.insert(ans, at: 0)
            score += usedWords.count
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startwords = try? String(contentsOf: startWordsURL) {
                let allWords = startwords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        
        showingError = true
    }
    
    func newGame() {
        startGame()
        score = 0
        usedWords = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
