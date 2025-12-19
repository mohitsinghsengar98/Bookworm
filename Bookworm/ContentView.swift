//
//  ContentView.swift
//  Bookworm
//
//  Created by Mohit Sengar on 17/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Book.title),SortDescriptor(\Book.author)]) var books : [Book] // maximum Rating
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink(value:book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title).font(.headline)
                                Text(book.author).foregroundStyle(.secondary)
                            }
                        }
                    }
                }.onDelete(perform: deleteBooks)
                
            }.navigationTitle("Books")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book", systemImage: "plus"){
                            showingAddBookSheet = true
                        }
                    }
                }.sheet(isPresented: $showingAddBookSheet){
                    AddBookView()
                }.navigationDestination(for: Book.self){ book in
                    DetailView(book:book)
                }
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
