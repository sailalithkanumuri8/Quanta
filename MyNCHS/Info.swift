//
//  Info.swift
//  Vista
//
//  Created by SaiLalith Kanumuri on 12/28/23.
//

import SwiftUI
import GoogleSignIn

// Displays the info page
struct Info: View {
    // Authenticates the user to enter the app
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    // Current instace of the user on the app
    private let user = GIDSignIn.sharedInstance.currentUser
    
    // Allows external links to pop up in the app
    @State var showWebView = false
    @State var showWebView2 = false
    @State var showWebView3 = false
    @State var showWebView4 = false
    @State var showWebView5 = false
    
    var isCalendar: Bool
    // Allows app to send notifications
    let notify = NotificationHandler()
    
    var body: some View {
        NavigationView {
            // Displays info page onto the screen when clicked on the menu
            ScrollView {
                VStack {
                    VStack {
                        VStack {
                            HStack {
                                // Collects user profile image from Google Sign In
                                NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(50)
                                    .padding(.trailing, 8)
                                
                                VStack {
                                    // Collects user profile name from Google Sign In
                                    Text("" + (user?.profile?.name ?? "") + "")
                                        .font(Font.custom("Quicksand-Bold", size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    // Collects user profile email from Google Sign In
                                    Text("" + (user?.profile?.email ?? "") + "")
                                        .font(Font.custom("Quicksand-Regular", size: 15))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        .offset(x: 10, y: 30)
                        
                        // When presses, it will sign out the user and will go back to the login page
                        Button(action: viewModel.signOut) {
                            Text("Sign Out")
                                .font(Font.custom("Quicksand-Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(width: 270, height: 55)
                                .background(Color("Color"))
                                .cornerRadius(20)
                                .padding()
                        }
                        .offset(y: 20)
                        
                        HStack {
                            Text("About Us")
                                .font(Font.custom("Quicksand-Regular", size: 12))
                                .padding()
                            
                            Text("Terms & Privacy")
                                .font(Font.custom("Quicksand-Regular", size: 12))
                                .padding()
                            
                        }
                        .offset(y: 10)
                    }
                    .padding()
                    .frame(width: 360, height: 270)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                    
                    VStack {
                        // Asks user for permission to send notifications for the calendar
                        HStack {
                            Text("Notifications")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                notify.askPermission()
                            } label: {
                                Text(">")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Quicksand-Bold", size: 18))
                                    .padding(8)
                                    .background(Color("Color"))
                                    .frame(height: 28, alignment: .trailing)
                                    .cornerRadius(40)
                            }
                        }
                        
                        // Bug Report
                        HStack {
                            Text("Report a bug")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                showWebView.toggle()
                            } label: {
                                VStack {
                                    Text(">")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Quicksand-Bold", size: 18))
                                        .padding(8)
                                        .background(Color("Color"))
                                        .frame(height: 28, alignment: .trailing)
                                        .cornerRadius(40)
                                }
                            }
                            .sheet(isPresented: $showWebView) {
                                WebView(url: URL(string: "https://forms.gle/LQGLW92o7KVhQG3Q8")!)
                            }
                        }
                        
                        // Button to tutorial and instructions if the user needs it
                        // Boosts accessability of the app to a larger demographic
                        HStack {
                            Text("Guides & Tutorials")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                showWebView2.toggle()
                            } label: {
                                VStack {
                                    Text(">")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Quicksand-Bold", size: 18))
                                        .padding(8)
                                        .background(Color("Color"))
                                        .frame(height: 28, alignment: .trailing)
                                        .cornerRadius(40)
                                }
                            }
                            .sheet(isPresented: $showWebView2) {
                                WebView(url: URL(string: "https://docs.google.com/document/d/1g8Oh0PrIpdjN9C6eT8H6-ci4KRpU0skzXFcHfyjMTR4/edit?usp=sharing")!)
                            }
                        }
                        
                        // Link to all of our work cited
                        HStack {
                            Text("Work cited")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                showWebView2.toggle()
                            } label: {
                                VStack {
                                    Text(">")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Quicksand-Bold", size: 18))
                                        .padding(8)
                                        .background(Color("Color"))
                                        .frame(height: 28, alignment: .trailing)
                                        .cornerRadius(40)
                                }
                            }
                            .sheet(isPresented: $showWebView2) {
                                WebView(url: URL(string: "https://docs.google.com/document/d/1g8Oh0PrIpdjN9C6eT8H6-ci4KRpU0skzXFcHfyjMTR4/edit?usp=sharing")!)
                            }
                        }
                        
                        // Link to github source code
                        HStack {
                            Text("Source Code")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                showWebView3.toggle()
                            } label: {
                                VStack {
                                    Text(">")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Quicksand-Bold", size: 18))
                                        .padding(8)
                                        .background(Color("Color"))
                                        .frame(height: 28, alignment: .trailing)
                                        .cornerRadius(40)
                                }
                            }
                            .sheet(isPresented: $showWebView4) {
                                WebView(url: URL(string: "https://github.com/BoltOfLightning/MyNCHSFBLA")!)
                            }
                        }
                        
                        // Enables user to email us with any questions
                        HStack {
                            Text("Contact Us")
                                .font(Font.custom("Quicksand-Bold", size: 18))
                                .frame(width: 260, alignment: .leading)
                            
                            Button {
                                showWebView4.toggle()
                            } label: {
                                VStack {
                                    Text(">")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Quicksand-Bold", size: 18))
                                        .padding(8)
                                        .background(Color("Color"))
                                        .frame(height: 28, alignment: .trailing)
                                        .cornerRadius(40)
                                }
                            }
                            .sheet(isPresented: $showWebView5) {
                                WebView(url: URL(string: "mailto:sailalithkanumuri@gmail.com")!)
                            }
                        }
                    }
                    .padding()
                    .frame(width: 360, height: 280)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                     
                    //Social media integration
                    Logos()
                        .frame(width: 330, height: 150)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom, 10)
                    
                    // A little thank you note
                    Text("Thank you for using our app!")
                        .font(Font.custom("Quicksand-Bold", size: 10))
                        .padding(.bottom, 5)
                    
                    Text("Please don't hesitate to ask any questions.")
                        .font(Font.custom("Quicksand-Bold", size: 10))
                        .padding(.bottom, 5)
                    
                    Text("Sai, Bryan, and Manvith")
                        .font(Font.custom("Quicksand-Bold", size: 10))
                        .padding(.bottom, 5)
                }
                .offset(y: isCalendar ? 0 : -95)
            }
            .background(Color.gray.opacity(0.1).frame(width: 500, height: 2000))
        }
        .navigationViewStyle(.stack)
    }
}

// Gets the profile image from the user
struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

// Social media links code
struct Logos: View {
    var body: some View {
        VStack {
            Text("Social Media")
                .font(Font.custom("Quicksand-Bold", size: 15))
                .offset(y: -10)
            
            HStack {
                // Instagram button
                LinkLogos(url: URL(string: "https://www.instagram.com/")!,
                           imageName: "Instagram",
                           imageWidth: 75,
                           imageHeight: 75,
                           brightness: 0,
                           blur: 0,
                           text1: "",
                           xOffset1: 0,
                           yOffset1: -30,
                           text2: "Instagram",
                           xOffset2: 0,
                           yOffset2: 40,
                           color: .black)
                
                // Twitter Button
                LinkLogos(url: URL(string: "https://twitter.com/")!,
                           imageName: "Twitter",
                           imageWidth: 75,
                           imageHeight: 75,
                           brightness: 0,
                           blur: 0,
                           text1: "",
                           xOffset1: 0,
                           yOffset1: -30,
                           text2: "Twitter",
                           xOffset2: 0,
                           yOffset2: 40,
                           color: .black)
                
                // Facebook button
                LinkLogos(url: URL(string: "https://m.facebook.com/")!,
                           imageName: "Facebook",
                           imageWidth: 75,
                           imageHeight: 75,
                           brightness: 0,
                           blur: 0,
                           text1: "",
                           xOffset1: 0,
                           yOffset1: -30,
                           text2: "Facebook",
                           xOffset2: 0,
                           yOffset2: 40,
                           color: .black)
                
                // Youtube button
                LinkLogos(url: URL(string: "https://www.youtube.com/")!,
                           imageName: "Youtube",
                           imageWidth: 75,
                           imageHeight: 75,
                           brightness: 0,
                           blur: 0,
                           text1: "",
                           xOffset1: 0,
                           yOffset1: -30,
                           text2: "Youtube",
                           xOffset2: 0,
                           yOffset2: 40,
                           color: .black)
            }
            .offset(y: -10)
        }
    }
}

