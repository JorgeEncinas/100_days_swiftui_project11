//
//  SwiftDataIntro.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/21/25.
//
import SwiftUI


// SwiftData is a powerful, modern framework
//      for storing, querying, and filtering data

//  It is an Object Graph and Persistence Framework
//      it lets us define objects and their properties
//      then lets us read and write them from permanent storage

//  And it works with SwiftUI very well.
//  There's Sorting, Filtering, working with much larger data,
//  with no limit to how much data it can store
//  Also has advanced functionality such as
//      - iCloud Syncing
//      - Lazy loading of data
//      - Undo, Redo
//      - and more...

// We'll set up SwiftData ourselves, it takes 3 steps
//  1. Define the data we want to use in our app
import SwiftData

//@Model //@Observable
//class Student {
//    var id: UUID
//    var name: String
//
//    init(id: UUID, name: String) {
//        self.id = id
//        self.name = name
//    }
//}

//With just the wrapper, it can
//  Load, save, query, delete, linkthem with other objects, and more.

// `@Model` is a SwiftData model, and defines some kind of data we want to work with in our apps
//  BTS it builds on the same observation system `@Observable` uses
//  so it works well with SwiftUI

// SWIFTDATA, STEP 2 - Writing code to LOAD the model
// It works best in the `App` struct

//import SwiftUI

//@main
struct BookwormApp2: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// `@main`
//      It tells Swift that this is what launches our App.
//      Internally, this bootstraps the whole program when the user launches the app

// `WindowGroup`
//      tells SwiftUI that our app can be displayed in many Windows.
//      While it doesn't do much on iPhone,
//      on iPad and macOS it becomes a lot more important.

// On this place we'll tell SwiftData to set up all of its storage for us to use

// STEP 1. Add `import SwiftData`
// STEP 2. Add the `modelContainer(for: Student.self)` modifier to WindowGroup()
//          To make SwiftData available everywhere in our app (my guess is that there must be a way to extend
//          to more than just the `Student` model
//@main
struct BookwormApp3: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}

// The 1st time, SwiftData will create the underlying database file
//  in future runs, it will load the database it made previously.

// So to recap, there are 3 COMPONENTS

//  1. Create data models with `@Model`
//  2. Create a Model Container with `.modelContainer()` modifier
//  3. `Model Context`, the LIVE version of our data.
//          when you load objects and change them,
//          those changes exist only in memory until they're saved
//      The job of the Model Context is to let us work with all our data IN-MEMORY
//          until we save the changes.
//      That is much faster than constantly reading and writing data to disk

// HOW TO CREATE THE MODEL CONTEXT
//      The usage of `.modelContainer` already does it for us,
//      SwiftData already creates a Model Context for us,
//      Called the `MAIN CONTEXT`, and stores it in SwiftUI's environment

// READING AND WRITING DATA

//import SwiftData

struct AnotherContentView : View {
    @Query var students: [Student]
    // the property wrapper makes SwiftData load students from the ModelContainer
    // Since we haven't specified WHICH students to get, it will get all of them
    
    //Now we can use the array as usual
    var body : some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
        }
    }
}


