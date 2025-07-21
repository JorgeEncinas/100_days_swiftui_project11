//
//  MultilineTextInput.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/21/25.
//
import SwiftUI

struct MultilineTextInput : View {
    @AppStorage("notes") private var notes = ""
    // Not designed for storing anything private, so never do that!
    
    var body : some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

// TextEditor is easier than TextField
//      You can't adjust its style or add placeholder text
//  However, you gotta make sure it doesn't go beyond the safe area.
//  Thus, we embed it inside a NavigationStack, a Form, or something of the sort.

// However, this is actually not the best thing, SwiftUI offers something better.


// TextField with `axis`

struct MultilineTextInput2 : View {
    @AppStorage("notes") private var notes = ""
    
    var body : some View {
        NavigationStack {
            TextField(
                "Enter your text",
                text: $notes,
                axis: .vertical
            )
            .textFieldStyle(.roundedBorder)
            .navigationTitle("Notes")
            .padding()
        }
    }
}

struct MultilineTextInput3 : View {
    @AppStorage("notes") private var notes = ""
    
    var body : some View {
        Form {
            TextField(
                "Enter your text",
                text: $notes,
                axis: .vertical
            )
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
}

struct MultilineTextInput4 : View {
    @AppStorage("notes") private var notes = ""
    
    var body : some View {
        NavigationStack {
            Form {
                TextField(
                    "Enter your text",
                    text: $notes,
                    axis: .vertical
                )
                .textFieldStyle(.roundedBorder)
            }
            .navigationTitle("Notes")
        }
    }
}


#Preview {
    //MultilineTextInput()
    MultilineTextInput4()
}
