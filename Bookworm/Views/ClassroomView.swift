//
//  ClassroomView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI
import SwiftData

struct ClassroomView : View {
    @Query var students: [Student]
    // the property wrapper makes SwiftData load students from the ModelContainer
    // Since we haven't specified WHICH students to get, it will get all of them
    @Environment(\.modelContext) var modelContext
    // Adding the context
    
    //Now we can use the array as usual
    var body : some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ringo", "John", "Paul", "George"]
                    let lastNames = ["Starr", "Lennon", "McCartney", "Harrison"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(
                        id: UUID(),
                        name: "\(chosenFirstName) \(chosenLastName)"
                    )
                    modelContext.insert(student)
                    
                }
            }
        }
    }
}

#Preview {
    ClassroomView()
}
