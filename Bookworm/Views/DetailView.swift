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
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
    
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
            
            VStack {
                Text(book.date.formatted(date: .long, time: .omitted))
                    .padding(.top, 10)
                    .foregroundStyle(.secondary)
                Text(book.review)
                    .padding([.bottom, .horizontal])
            }

            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            //Here `.constant` makes it so users can't modify it.
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
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
