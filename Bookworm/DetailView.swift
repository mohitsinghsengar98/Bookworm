//
//  DetailView.swift
//  Bookworm
//
//  Created by Mohit Sengar on 18/12/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book : Book
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre).resizable().scaledToFit()
                
                Text(book.genre.uppercased()).fontWeight(.black).padding(8).foregroundStyle(.white).background(.black.opacity(0.75)).clipShape(.capsule).offset(x: -5, y: -5)
            }
            
            Text(book.author).font(.title).foregroundStyle(.secondary)
            
            Text(book.review).padding()
            
            RatingView(rating: .constant(book.rating)).font(.largeTitle)
        }.navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
        
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Book.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    let book = Book(
        title: "Preview Book",
        author: "Author",
        genre: "Fantasy",
        review: "Preview review",
        rating: 4
    )
    
    container.mainContext.insert(book)
    
    return DetailView(book: book)
        .modelContainer(container)
}
