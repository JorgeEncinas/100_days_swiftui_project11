//
//  Student.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI
import SwiftData

@Model //@Observable
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

