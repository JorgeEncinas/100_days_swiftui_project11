//
//  ContentView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/21/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books : [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        //ClassroomView()
        NavigationStack {
            VStack {
                Text("Count: \(books.count)")
                ListBooksView(books: books)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
