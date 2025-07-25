//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI

struct AddBookView : View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @State private var presentingValidationAlert = false
    
    
    var body : some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    //Picker("Rating", selection: $rating) {
                    //    ForEach(0..<6) {
                    //        Text(String($0))
                    //    }
                    //}
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        if(isBookValid()) {
                            let newBook = Book(
                                title: title,
                                author: author,
                                genre: genre,
                                review: review,
                                rating: rating
                            )
                            modelContext.insert(newBook)
                            dismiss()
                        } else {
                            presentingValidationAlert.toggle()
                        }
                        
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Book not valid", isPresented: $presentingValidationAlert) {
                Button("OK") {}
            } message: {
                Text("Please make sure you add a title, author, and a valid genre.")
            }
        }
    }
    
    func isBookValid() -> Bool {
        if (isStringValid(title) &&
            isStringValid(author) &&
            //isStringValid(review) &&
            isStringValid(genre)) {
            return true
        }
        return false
    }
    
    func isStringValid(_ target : String) -> Bool {
        let trimmedTarget = target.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedTarget.isEmpty {
             return false //Not valid
        }
        return true // Valid
    }
}

#Preview {
    AddBookView()
}
