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
    @Query(sort: \Book.rating, order: .reverse) var books : [Book] // maximum Rating
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){book in
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
                }
                
            }.navigationTitle("Books")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            showingAddBookSheet = true
                        } label:{
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showingAddBookSheet){
                    AddBookView()
                }.navigationDestination(for: Book.self){ book in
                    DetailView(book:book)
                }
        }
    }
}

#Preview {
    ContentView()
}
