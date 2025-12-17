//
//  ContentView.swift
//  Bookworm
//
//  Created by Mohit Sengar on 17/12/25.
//

import SwiftUI

struct CurvedButton:View {
    var message:String = ""
    @Binding var rememberMe:Bool
    
    var body: some View {
        Button(message){
            rememberMe.toggle()
        }.font(.title).buttonStyle(.bordered).padding()
        
    }
}

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    @State private var rememberMe: Bool = false
    @State private var name: String = ""
    
    var body: some View {
        CurvedButton(message: "Toggle", rememberMe: $rememberMe)
        Text(rememberMe ? "ON" : "OFF")
        Form{
//            TextField("Enter name", text: $name, axis: .vertical).font(.subheadline).padding()
            TextEditor(text: $notes) // text editor will be scrollable on its own.
        }
    }
}

#Preview {
    ContentView()
}
