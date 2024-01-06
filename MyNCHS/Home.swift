//
//  Home.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/19/23.
//

import SwiftUI
import GoogleSignIn

// Displays the home page
struct Home: View {
    // Current instance of the user
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            // Page layout
            ScrollView {
                HStack {
                    Text("Home")
                        .font(Font.custom("Quicksand-Bold", size: 30))
                        .padding(15)
                        .offset(x: 8, y: 10)
                    
                    Spacer()
                    
                    // User's profile image
                    NavigationLink(destination: Info(isCalendar: false)) {
                        NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(30)
                            .offset(x: -20, y: 10)
                    }
                }
                
                // Profile name of the user, got from Google
                Text("Welcome, \(user?.profile?.name ?? "")")
                    .font(Font.custom("Quicksand-Regular", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 25)
                
                // All the info drawn on the screen
                VStack {
                    VStack {
                        // Gets the date and displays it
                        VStack {
                            HStack {
                                Image(systemName: "cloud")
                                    .renderingMode(.original)
                                
                                Text("CLOUDY")
                                    .font(Font.custom("Quicksand-Bold", size: 10))
                            }
                            
                            Text(Date.now, format: .dateTime.hour().minute())
                                .font(Font.custom("Quicksand-Bold", size: 60))
                                .foregroundColor(Color("Color"))
                            
                            Text(Date.now, format: .dateTime.day().month().year())
                                .font(Font.custom("Quicksand-Regular", size: 15))
                                .padding(.bottom, 20)
                            
                            Text("Semester 1")
                                .font(Font.custom("Quicksand-Bold", size: 10))
                            
                            Image("Flower1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .offset(x: -155, y: -70)
                            
                            Image("Flower2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                                .offset(x: 140, y: -200)
                        }
                        .offset(y: 120)
                    }
                    .padding()
                    .frame(width: 350, height: 200)
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: 10)
                    .padding(.bottom, 10)
                }
                
                // Horizontal view for the news
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        LinkNews(url: URL(string: "https://northcreek.nsd.org/our-school/calendar")!,
                                 image: "News3",
                                 text1: "1st Quarter Closed!",
                                 text2: "Great job everyone for finishing 1/4 of the year!",
                                 text3: "1 Nov 2023 • Vista")
                        
                        LinkNews(url: URL(string: "https://northcreek.nsd.org/our-school/calendar")!,
                                 image: "News3",
                                 text1: "School Started",
                                 text2: "School is finally in session. Please be sure to have supplies ready!",
                                 text3: "6 Sept 2023 • Vista")
                        
                        LinkNews(url: URL(string: "https://www.collegeboard.org/")!,
                                 image: "News3",
                                 text1: "AP Collegeboard",
                                 text2: "All 2023 AP Exam Scores have been released!",
                                 text3: "15 July 2023 • Vista")
                    }
                    .padding(40)
                }
                .offset(x: -20, y: -30)
            }
            .background(Color.gray.opacity(0.1).frame(width: 500, height: 1000))
            .navigationViewStyle(.stack)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

