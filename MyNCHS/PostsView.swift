//
//  PostsView.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 4/22/24.
//

import SwiftUI
import SDWebImageSwiftUI
import GoogleSignIn

struct PostsView: View {
    @State private var posts: [Post] = [
        Post(username: "Manvith Kothapalli", text: "Hello, everyone! I'm proud to announce that I've established the Learnable Non-Profit which teaches kids about Astronomy and Physics. Here is the website link: https://saikanbolt.wixsite.com/learnable", imageURL: URL(string: "https://lh3.googleusercontent.com/a/ACg8ocJVKzDzr2U7Mohfcu-XyuqtXwJrSmvkOdrGxfH0DonSZmEDdMI=s576-c-no"), ProfileImageURL: URL(string: "https://media.licdn.com/dms/image/D5603AQHMbKAU60Dhmw/profile-displayphoto-shrink_800_800/0/1706942629260?e=2147483647&v=beta&t=CRQlQGHbFPhNX5ko-TCE_4s1vpcX7zp7v7CxKuv-TeE"), likes: 20, dislikes: 0, comments: [
            Comment(text: "Great work!", commenterName: "Harshith Gorthy", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!),
            Comment(text: "Keep it up!", commenterName: "Bhanu Paderla", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!)
        ]),
        Post(username: "Bhanu Paderla", text: "Hello everyone, I am proud to announce that I have recieved the golden presidential volunteer service award for more than 250 hours of volunteer serivce.", imageURL: URL(string: "https://feministsformen.org/wp-content/uploads/2021/10/medallion-1.jpg"), ProfileImageURL: URL(string: "https://dmc.ag/wp-content/uploads/2022/06/DMC_Aventador_S_LP740_Carbon_Fiber_Front_Lip_02-1024x576.jpg"), likes: 7, dislikes: 0, comments: [
            Comment(text: "Nice Job Dhanush!", commenterName: "Bryan Nie", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!),
        ]),
        Post(username: "Bryan Nie", text: "Hello, everyone! I'm proud to announce that I'm off to the Washington State FBLA Competition with Manvith and Sai Lalith after getting second place at North Creek Champions Challenge where I'm confident that I'll get first place!", imageURL: URL(string: "https://wafbla.org/wp-content/uploads/2022/08/FBLA_Washington_Horizontal_Color.png"), ProfileImageURL: URL(string: "https://wallpapers.com/images/hd/cool-profile-picture-kpwjvjw5434qfzo3.jpg"), likes: 8, dislikes: 2, comments: [
            Comment(text: "Great work! I know your gonna get first place for Mobile App at State", commenterName: "Bhanu", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!),
            Comment(text: "Nice Job! Hope you get first place!", commenterName: "Bhanu Paderla", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!),
            Comment(text: "Awesome! Good luck at State", commenterName: "Nikhil Bandaru", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!)
        ]),
        Post(username: "Harshith Gorthy", text: "Hello, everyone! I'm proud to announce that I've got admitted to the University of Washington", imageURL: URL(string: "https://media.king5.com/assets/KING/images/be0b506c-192c-4ca6-9c04-374224dadf9f/be0b506c-192c-4ca6-9c04-374224dadf9f_750x422.jpg"), ProfileImageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMmU4ZTM0MTctZTQ3Ny00YjZmLWFhNzEtOGYzMDk0ZjcyNmYzXkEyXkFqcGdeQXVyMTUyNjIwMDEw._V1_UY1200_CR165,0,630,1200_AL_.jpg"), likes: 15, dislikes: 2, comments: [
            Comment(text: "You're gonna do great at UW", commenterName: "Manvith Kothapalli", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!),
            Comment(text: "Niceeee!", commenterName: "Sai Lalith Kanumuri", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!)
        ])
    ]
    @State private var newPostText = ""
    @State private var newCommentText = ""
    @State private var showNewPostSheet = false
    @State private var selectedPost: Post?
    @State private var showComments = false
    private let user = GIDSignIn.sharedInstance.currentUser
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .offset(x: 25, y: 10)
                    
                    Text("Home")
                        .font(Font.custom("Quicksand-Bold", size: 30))
                        .padding(15)
                        .offset(x: 10, y: 10)
                    
                    Spacer()
                    
                    if #available(iOS 17.0, *) {
                        NavigationLink(destination: ChatBot()) {
                            Text("Gemini")
                                .font(Font.custom("Quicksand-Bold", size: 10))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color("Color"))
                                .cornerRadius(15)
                                .frame(width: 70, height: 50, alignment: .center)
                        }
                        .padding(.trailing, 5)
                        .offset(x: -10, y: 15)
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    // User's profile image
                    NavigationLink(destination: Info(isCalendar: false)) {
                        NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(30)
                            .offset(x: -20, y: 12)
                    }
                }
                
                // Profile name of the user, got from Google
                Text("Welcome, \(user?.profile?.name ?? "")")
                    .font(Font.custom("Quicksand-Regular", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 25)
                    .padding(.bottom, 15)
                
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
                        
                        Text("Semester 2")
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
                .offset(y: 0)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(posts) { post in
                        PostView(post: post, posts: $posts, newCommentText: $newCommentText, selectedPost: $selectedPost, showComments: $showComments)
                    }
                }
                .padding([.leading, .trailing, .bottom], 20)
                
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
                .offset(x: -20, y: -45)
                
            }
            .background(Color.gray.opacity(0.1).frame(width: 500, height: 1000))
            .overlay(
                Button(action: {
                    showNewPostSheet.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .font(Font.custom("Quicksand-Bold", size: 15))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Color"))
                        .cornerRadius(20)
                })
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            )
            .sheet(isPresented: $showNewPostSheet) {
                NewPostView(posts: $posts, text: $newPostText)
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}

