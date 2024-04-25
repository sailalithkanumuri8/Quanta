//
//  ChatBot.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 4/25/24
//

import SwiftUI

@available(iOS 17.0, *)
struct ChatBot: View {
    @State var textInput = ""
    @State var logoAnimating = false
    @State var timer: Timer?
    @State var chatService = ChatService()
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ZStack(alignment: .leading) {
                    Color.black
                        .cornerRadius(30)

                    VStack(alignment: .leading) {
                        Image(.geminiLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 50)
                            .opacity(logoAnimating ? 0.5 : 1)
                            .animation(.easeInOut, value: logoAnimating)
                    }
                    .padding()
                }
                .frame(width: 370, height: 50, alignment: .leading)
            }
            .padding()
            
            ScrollViewReader(content: { proxy in
                ScrollView {
                    ForEach(chatService.messages) { chatMessage in
                        chatMessageView(chatMessage)
                    }
                    .frame(width: 370)
                }
                .onChange(of: chatService.messages) { _, _ in
                    guard let recentMessage = chatService.messages.last else { return }
                    DispatchQueue.main.async {
                        withAnimation {
                            proxy.scrollTo(recentMessage.id, anchor: .bottom)
                        }
                    }
                }
                .onChange(of: chatService.loadingResponse) { _, newValue in
                    if newValue {
                        startLoadingAnimation()
                    } else {
                        stopLoadingAnimation()
                    }
                }
            })
            
            HStack {
                CustomTextField(placeholder: Text("Message"), text: $textInput)
                    .frame(height: 52)
                    .disableAutocorrection(true)

                // Uses the message manager to send the message to Firestore
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.black)
            .frame(width: 370)
            .cornerRadius(20)
            .padding()
        }
        .foregroundStyle(.white)
        .padding()
        .background {
            ZStack {
                Color.black.opacity(0.5)
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder func chatMessageView(_ message: ChatMessage) -> some View {
        ChatBubble(direction: message.role == .model ? .left : .right) {
            Text(message.message)
                .padding(17)
                .font(Font.custom("Quicksand-Medium", size: 15))
                .foregroundColor(.black)
                .background(message.role == .model ? Color.white : Color("Light Blue"))
                .cornerRadius(30)
                .padding(.bottom, 5)
        }
    }
    
    func sendMessage() {
        chatService.sendMessage(textInput)
        textInput = ""
    }

    func startLoadingAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            logoAnimating.toggle()
        })
    }
    
    func stopLoadingAnimation() {
        logoAnimating = false
        timer?.invalidate()
        timer = nil
    }
}
