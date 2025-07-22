//
//  SortDescriptorExamples.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI
import SwiftData

struct SortDescriptorExamples : View {
    @Query(sort: \Book.title) var books: [Book]
    @Query(sort: \Book.rating, order: .reverse) var books2 : [Book]
    // `SortDescriptor` allows us to sort by one field, then by another.
    //      Here first this just sorts alphabetically on the `title` property
    @Query(sort: [SortDescriptor(\Book.title)]) var books3: [Book]
    // With `reverse`
    @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books4: [Book]
    // More than one `SortDescriptor`
    //  These are applied IN THE ORDER PROVIDED
    //  You can ask for X ascending, Y descending, and so on.
    //  Having a 2nd or 3rd sort field has little to no performance impact,
    //  UNLESS you have lots of data with similar values.
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books5 : [Book]
    
    var body : some View {
        VStack {
            
        }
    }
}
