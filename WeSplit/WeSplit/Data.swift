//
//  Data.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/3/21.
//

import Foundation

// just fun random quotes:
let flandersQuote = [
    "Hi diddly ho neighborinos!",
    "He's a hero all right, a hero sandwich full of bologna!",
    "Now I know you've had a few too many waters, but that is no reason for the sailor talk.",
    "That sounds salty, but you seem sweet. I'm going to call you kettle corn.",
    "I guess now we know why they call them rapids and not 'slow-pids', huh?",
    "Oh my, what a little mess we've got here. Well, which ones are yours and which ones are mine?"
]

// info taken form StackOver Flow
/*
 For Swift 5 & 6
 https://stackoverflow.com/questions/57665746/swift-5-xcode-11-betas-5-6-how-to-write-to-a-json-file
 */

func writeData(_ totals: [Double]) -> Void {
    do {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("pastData.json")
        
        try JSONEncoder()
            .encode(totals)
            .write(to: fileURL)
    } catch {
        print("error writing data")
    }
}

func readData() -> [Double] {
    do {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("pastData.json")
        
        let data = try Data(contentsOf: fileURL)
        let pastData = try JSONDecoder().decode([Double].self, from: data)
        
        return pastData
    } catch {
        print("error reading data")
        return []
    }
}


// Old code: to the stuff above
/*
 func saveDataToFile(totals: [Double]) -> Void {
 var text = "[\n"
 
 if !totals.isEmpty{
 for i in totals {
 text += String(i)+",\n"
 }
 }
 text += "]"
 
 // gets the path for the JSON Data - locate the json file in the app bundle
 guard let path = Bundle.main.path(forResource: "pastTips", ofType: "json") else {
 return
 }
 
 // Generates a URL for the path
 let url = URL(fileURLWithPath: path)
 
 do {
 try text.write(toFile: url.path, atomically: true, encoding: .utf8)
 } catch {
 print("error wiriting to file!")
 }
 }
 
 /*
  func getData() -> [Double] {
  var parsedData: [Double]
  
  // gets the path for the JSON Data - locate the json file in the app bundle
  guard let path = Bundle.main.path(forResource: "pastTips", ofType: "json") else {
  return []
  }
  
  // Generates a URL for the path
  let url = URL(fileURLWithPath: path)
  
  do {
  let jsonData = try Data(contentsOf: url)
  parsedData = try JSONDecoder().decode([Double].self, from: jsonData)
  
  print(parsedData)
  
  
  } catch {
  return []
  }
  
  return parsedData
  }*/
 
 // Hacking with Swift Method
 func getData() -> [Double] {
 let data = Bundle.main.decode([Double].self, from: "pastTips.json")
 
 return data
 }
 
 // extension form Hacking with swift
 extension Bundle {
 func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
 guard let url = self.url(forResource: file, withExtension: nil) else {
 fatalError("Failed to locate \(file) in bundle.")
 }
 
 guard let data = try? Data(contentsOf: url) else {
 fatalError("Failed to load \(file) from bundle.")
 }
 
 let decoder = JSONDecoder()
 decoder.dateDecodingStrategy = dateDecodingStrategy
 decoder.keyDecodingStrategy = keyDecodingStrategy
 
 do {
 return try decoder.decode(T.self, from: data)
 } catch DecodingError.keyNotFound(let key, let context) {
 fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
 } catch DecodingError.typeMismatch(_, let context) {
 fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
 } catch DecodingError.valueNotFound(let type, let context) {
 fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
 } catch DecodingError.dataCorrupted(_) {
 fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
 } catch {
 fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
 }
 }
 }*/

