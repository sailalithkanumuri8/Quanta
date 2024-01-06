//
//  ContentView.swift
//  ChatBotMain
//
//  Created by Jared Davidson on 12/19/23.
//

import SwiftUI

struct ChatBot: View {
    @ObservedObject var viewModel: ChatViewModel
    
    @State private var newMessage = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ZStack(alignment: .leading) {
                    Color.black.opacity(0.05)
                        .cornerRadius(30)

                    VStack(alignment: .leading) {
                        Text("GPT")
                            .font(Font.custom("Quicksand-Bold", size: 30))
                            .foregroundColor(.black)
                            .padding(.leading, 8)
                    }
                    .padding()
                }
                .frame(width: 370, height: 80, alignment: .leading)
            }
            .padding()
            
            MessagesListView(messages: viewModel.messages) // Display chat messages
            
            HStack {
                // Custom text field created below
                CustomTextField(placeholder: Text("Message"), text: $newMessage)
                    .frame(height: 52)
                    .disableAutocorrection(true)

                // Uses the message manager to send the message to Firestore
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color("Color"))
                        .padding(10)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color("Light Blue"))
            .cornerRadius(20)
            .padding()
            
        }
        .onAppear {
            viewModel.setupOpenAI() // Initialize OpenAI when the view appears
        }
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        viewModel.sendUserMessage(newMessage) // Send user's message to view model
        newMessage = "" // Clear the input field
    }
}

struct MessagesListView: View {
    var messages: [ChatMessage]
    
    var body: some View {
        List(messages) { message in
            MessageRow(message: message) // Display individual chat messages
        }
        .listStyle(.plain)
        .background(Color.clear)
    }
}

struct MessageRow: View {
    var message: ChatMessage

    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.message)
                    .padding(17)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .background(Color("Light Blue"))
                    .cornerRadius(30)
                    .padding(.bottom, 5)
            } else {
                Text(message.message)
                    .padding(17)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(30)
                    .padding(.bottom, 5)
                Spacer()
            }
        }
    }
}

struct ChatMessage: Identifiable {
    var id = UUID()
    var message: String
    var isUser: Bool
}
