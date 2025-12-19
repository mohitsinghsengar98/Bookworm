//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mohit Sengar on 18/12/25.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var genre = "Fantasy"
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var isValidData : Bool{
        if (title.isEmpty || author.isEmpty || review.isEmpty){
            return false
        }
        
        return true
    }
    
    let genres = ["Fantasy", "Romance", "Thriller", "Mystery", "Kids", "Horror"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name",text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id:\.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text:$review)
                    
//                    Picker("Rating" ,selection: $rating){
//                        ForEach(1..<6){
//                            Text(String($0))
//                        }
//                    }
                    RatingView(rating: $rating,label: "Rating")
                }
                
                Section{
                    Button("Save"){
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating:rating)
                        modelContext.insert(newBook)
                        alertMessage = "Sucessfully Added the book into your review books list."
                        showingAlert = true
                    }
                }.disabled(!isValidData)
            }.navigationTitle("Add Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button("Close"){
                        dismiss()
                    }
                }
                .alert("Alert", isPresented: $showingAlert, actions: {Button("Ok"){dismiss()}}, message: {Text(alertMessage)})
        }
        
    }
}

#Preview {
    AddBookView()
}
