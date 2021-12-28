//
//  AddBookView.swift
//  Bookworm
//
//  Created by Luthfor Khan on 12/27/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Basic Info") {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    HStack {
                        Spacer()
                        RatingView(rating: $rating)
                        Spacer()
                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        
                        dismiss()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                }
                .disabled(isIncomplete())
            }
            .navigationTitle("Add Book")
        }
    }
    
    func isIncomplete() -> Bool {
        if (title.isEmpty) {
            return true
        } else {
            if author.isEmpty {
                return true
            } else {
                if genre.isEmpty {
                    return true
                } else {
                    return false
                }
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
