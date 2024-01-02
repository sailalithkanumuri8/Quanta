//
//  MessageField.swift
//  Vista
//
//  Created by Manvith Kothapalli on 12-22-23.
//

import SwiftUI

// ALlows the user to send messages
struct MessageField: View {
    @EnvironmentObject var messageManager: MessagesManager
    @State private var message = ""

    var body: some View {
        HStack {
            // Custom text field created below
            CustomTextField(placeholder: Text("Message"), text: $message)
                .frame(height: 52)
                .disableAutocorrection(true)

            // Uses the message manager to send the message to Firestore
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
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
}

// This is the text field in the MessageField
// Message field uses this code
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                    .font(Font.custom("Quicksand-Medium", size: 20))
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
