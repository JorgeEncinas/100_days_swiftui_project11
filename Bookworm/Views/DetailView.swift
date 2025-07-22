//
//  DetailView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI
import SwiftData

struct DetailView : View {
    let book : Book
    //Creating books, now that they're annotated with `@Model`
    // now requires them to have a view Context to create it inside.
    // If you create a SwiftData model object without a container around
    //  it is likely to crash
    
    var body : some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            //Here `.constant` makes it so users can't modify it.
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: Book.self,
            configurations: config
        )
        let example = Book(
            title: "Test Book",
            author: "Test Author",
            genre: "Fantasy",
            review: "This was a great book; I really enjoyed it.",
            rating: 4
        )
        
        return NavigationStack {
            DetailView(book : example)
                .modelContainer(container)
        }
    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}
