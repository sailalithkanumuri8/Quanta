//
//  MessagesManager.swift
//  Vista
//
//  Created by Manvith Kothapalli on 12/22/23.
//


import FirebaseFirestore
import FirebaseFirestoreSwift

// Links app to Firebase Firestore, our data base
class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    let collectionName: String // Name of the Firestore collection
    
    init(collectionName: String) {
        self.collectionName = collectionName
        getMessages()
    }

    // Collects the messages from the database to make it dynamic
    func getMessages() {
        db.collection(collectionName).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    // Function to allow the user to send the message and include that in Firestore
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection(collectionName).document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}

