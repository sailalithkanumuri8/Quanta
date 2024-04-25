//
//  NewPostView.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 4/21/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewPostView: View {
    @Binding var posts: [Post]
    @Binding var text: String
    @State private var selectedImageURL: URL?
    @State private var showImagePicker = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Add Post")
                    .font(Font.custom("Quicksand-Bold", size: 30))
                    .frame(width: 340, alignment: .leading)
                    .offset(x: -10)
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                
                CustomTextField(placeholder: Text("Type Here"), text: $text)
                    .frame(height: 50)
                    .padding(.leading, 15)
                    .disableAutocorrection(true)
        
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .padding()
                    
                    if let imageURL = selectedImageURL {
                        WebImage(url: imageURL)
                            .resizable()
                            .scaledToFit()
                            .padding()
                        Button(action: {
                            selectedImageURL = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                }
                
                // Buttons
                HStack {
                    Button(action: {
                        showImagePicker = true
                    }) {
                        Image(systemName: "photo.on.rectangle")
                            .font(Font.custom("Quicksand-Bold", size: 15))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color("Color"))
                            .cornerRadius(20)
                            .padding(.leading, 15)
                    }
                    Spacer()
                    
                    Button(action: {
                        // Post the new post
                        addPost()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .font(Font.custom("Quicksand-Bold", size: 15))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color("Color"))
                            .cornerRadius(20)
                            .padding(.trailing, 15)
                    }
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImageURL: $selectedImageURL)
            }
            .navigationTitle("Add Post")
        }
    }
    
    // Function to add the post
    func addPost() {
        guard !text.isEmpty else { return }
        let profileImageURL = URL(string: "https://media.licdn.com/dms/image/D5603AQHMbKAU60Dhmw/profile-displayphoto-shrink_800_800/0/1706942629260?e=2147483647&v=beta&t=CRQlQGHbFPhNX5ko-TCE_4s1vpcX7zp7v7CxKuv-TeE") // Replace with your desired profile image URL
        let newPost = Post(username: "Sai Lalith", text: text, imageURL: selectedImageURL, ProfileImageURL: profileImageURL)
        posts.append(newPost)
        text = ""
        selectedImageURL = nil
    }
}

struct ImagePicker: View {
    @Binding var selectedImageURL: URL?

    var body: some View {
        List {
            ForEach(prePopulatedImageURLs, id: \.self) { imageURL in
                Button(action: {
                    self.selectedImageURL = imageURL
                }) {
                    WebImage(url: imageURL)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }

        
        let prePopulatedImageURLs: [URL] = [
            URL(string: "https://i.ebayimg.com/images/g/0SwAAOSwr15f0y1~/s-l1200.jpg")!,
            URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!,
            URL(string: "https://sites.uw.edu/joeykey/files/2024/02/Manvith-1a2a35d38efebfba-150x150.jpg")!,
            URL(string: "https://www.usnews.com/dims4/USNEWS/70dc21c/17177859217/resize/800x540%3E/quality/85/?url=https%3A%2F%2Fmedia.beam.usnews.com%2Fc8%2Fc1f072147e28aabbb84a9f0d87d2e3%2Foldwell.JPG")!,
            URL(string: "https://imageio.forbes.com/specials-images/imageserve/1209892117/Dunster-House/960x0.jpg?format=jpg&width=960")!
        ]
    }
