//
//  ListBooksView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI

struct ListBooksView : View {
    var books : [Book]
    let deleteBooks : (_ offsets: IndexSet) -> Void
    
    var body : some View {
        List {
            ForEach(books) { book in
                NavigationLink(value: book) {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                                .foregroundStyle(book.rating < 2 ? .red : .primary)
                            
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .onDelete { (offsets : IndexSet) in
                deleteBooks(offsets)
            }
        }
    }
}

#Preview {
    let books : [Book] = [
        Book(
            title: "Example", author: "Person", genre: "Horror", review: "ok i guess", rating: 2
        ),
        Book(
            title: "Example2", author: "Person2", genre: "Horror", review: "ok i guess", rating: 4
        ),
        Book(
            title: "Example3", author: "Person3", genre: "Horror", review: "ok i guess", rating: 5
        )
    ]
    let deleteOffsets : (_ offsets : IndexSet) -> Void = { offset in
        print("Done")
    }
    NavigationStack {
        ListBooksView(books: books, deleteBooks: deleteOffsets)
    }
}
