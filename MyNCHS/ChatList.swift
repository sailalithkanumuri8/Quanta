//
//  User.swift
//  Vista
//
//  Created by Manvith Kothapalli on 12/21/23.
//

import SwiftUI
import GoogleSignIn

// This is the view for the messages
// Included this because this is the main messaging hub, white the button in network is direct messaging
// We want to emphasize the connectivity of our app
struct ChatList: View {
    // Current instance of the user on the app
    private let user = GIDSignIn.sharedInstance.currentUser
    
    // names and emails of the user
    var names: [String] = ["Manvith Kothapalli", "Bryan Nie", "Rithin Karthik", "Dhanush Eashwar", "Bhanu Pedarla", "Harshith Gorthy", "Nikhil Bandaru"]
    
    var emails: [String] = ["manvithkothapalli@gmail.com", "bryannie@gmail.com", "rithinkarthik@gmail.com", "dhanusheashwar@gmail.com", "bhanupedarla@gmail.com", "harshithgorthy@gmail.com", "nikhilbandaru@gmail.com"]
    
    // Allows connectivity from the app to the Firebase Firestore to fetech and send data
    var messagesManagers: [MessagesManager] = [
        MessagesManager(collectionName: "Manvith Kothapalli"),
        MessagesManager(collectionName: "Bryan Nie"),
        MessagesManager(collectionName: "Rithin Karthik"), MessagesManager(collectionName: "Dhanush Eashwar"),
        MessagesManager(collectionName: "Bhanu Pedarla"), MessagesManager(collectionName: "Harshith Gorthy"),
        MessagesManager(collectionName: "Nikhil Bandaru")
    ]
    
    var body: some View {
        NavigationView {
            // Page content
            ScrollView {
                VStack {
                    HStack {
                        Text("Messages")
                            .font(Font.custom("Quicksand-Bold", size: 30))
                            .padding(15)
                            .offset(x: -9, y: 10)
                        
                        Spacer()
                        
                        // Dipslays user's profile image
                        NavigationLink(destination: Info(isCalendar: false)) {
                            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                                .cornerRadius(30)
                                .offset(x: -5, y: 10)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    // Layout for all the message buttons
                    // When clicked, it would go the messages for the individual person
                    ForEach(names.indices, id: \.self) { index in
                        NavigationLink(destination: MessageView(messagesManager: messagesManagers[index], name: names[index], email: emails[index])) {
                            VStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack {
                                        Image("Profile")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .cornerRadius(30)
                                            .offset(x: 10, y: 5)
                                        
                                        Text(names[index])
                                            .foregroundColor(.black)
                                            .font(Font.custom("Quicksand-Bold", size: 18))
                                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 10))

                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                            .padding(.top, 10)
                                            .padding(.trailing, 15)
                                    }
                                    .padding(.vertical, 12)

                                }
                                .padding(.bottom, 10)
                            }
                            .background(.white)
                            .frame(width: 350, height: 70)
                            .cornerRadius(20)
                            .padding(.bottom, 4)
                            .navigationBarBackButtonHidden(true)
                        }
                    }
                }
                .padding(.horizontal)
                .listStyle(PlainListStyle())
                .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
