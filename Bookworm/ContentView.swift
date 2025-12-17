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
    @State private var rememberMe: Bool = false
    
    var body: some View {
        CurvedButton(message: "Toggle", rememberMe: $rememberMe)
        Text(rememberMe ? "ON" : "OFF")
    }
}

#Preview {
    ContentView()
}
