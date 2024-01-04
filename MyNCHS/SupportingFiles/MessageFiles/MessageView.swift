//
//  MessageView.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 12/23/23.
//

import SwiftUI

// This displays the entire message view on the screen
// Uses the other structs to make this struct as clean as possible to view
struct MessageView: View {
    // Allows linkup with firebase for each user
    @ObservedObject var messagesManager: MessagesManager;
    let chatHistories: [(imageUrl: String, name: String)] = [
        ("URL_TO_IMAGE_1", "Chat History 1"),
        ("URL_TO_IMAGE_2", "Chat History 2"),
    ]
    
    let name: String
    let email: String
    
    var body: some View {
        VStack {
            VStack {
                // Top of the screen with the name and email
                TitleRow(name: name, email: email)
                
                // This shows each of the individual messages
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 20)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            
            // Finally the message field at the bottom
            MessageField()
                .environmentObject(messagesManager)
        }
        .background(Color.black.opacity(0.05))
    }
}
