//
//  MessageBubble.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 12-22-23.
//

import SwiftUI

// This is each individual message in the messages
struct MessageBubble: View {
    // Uses the messages class
    var message: Message
    @State private var showTime = false

    var body: some View {
        // Waits for the message to be recieved before placing text in the MessageView
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding(17)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .background(message.received ? Color.white : Color("Light Blue"))
                    .cornerRadius(30)
                    .padding(.bottom, 5)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }

            // When the message bubble is pressed, it shows the time
            if showTime {
                Text("(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }

        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "The Salaar Movie go Crazy!!!", received: true, timestamp: Date()))
    }
}
