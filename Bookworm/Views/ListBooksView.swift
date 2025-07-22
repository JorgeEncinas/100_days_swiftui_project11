//
//  ListBooksView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI

struct ListBooksView : View {
    var books : [Book]
    
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
                            
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
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
    NavigationStack {
        ListBooksView(books: books)
    }
}
