//
//  URLView.swift
//  CupcakeCorner
//
//  Created by Luthfor Khan on 12/25/21.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct URLView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) {
            item in
            VStack(alignment: .leading) {
                            Text(item.trackName)
                                .font(.headline)
                            Text(item.collectionName)
                        }
        }
        .task {
            // await is required for async
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct URLView_Previews: PreviewProvider {
    static var previews: some View {
        URLView()
    }
}