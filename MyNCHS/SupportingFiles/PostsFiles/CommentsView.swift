//
//  CommentsView.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 4/21/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentsView: View {
    var post: Post
    @Binding var posts: [Post]
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) { // Align all content to the leading edge
            ScrollView {
                ForEach(post.comments, id: \.self) { comment in
                    CommentBubble(comment: comment)
                }
            }
            commentInputSection
        }
        .padding() // Add padding to the entire VStack
    }
    
    private var commentInputSection: some View {
        HStack {
            // Custom text field created below
            CustomTextField(placeholder: Text("Add a comment"), text: $text)
                .frame(height: 52)
                .disableAutocorrection(true)

            // Uses the message manager to send the message to Firestore
            Button {
                addComment()
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
    }
    
    private func addComment() {
        guard !text.isEmpty else { return }
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            // Create a new Comment object with the provided text and default name/profile pic
            let newComment = Comment(text: text, commenterName: "Sai Lalith Kanumuri", commenterProfileImageURL: URL(string: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KPLJWa27-5I0Zx9EbPT2-2-5-UkftLCYi.jpg?t=168263797193")!)
            posts[index].comments.append(newComment)
            text = ""
        }
    }
}

struct CommentBubble: View {
    var comment: Comment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) { // Align the commenter name and text to the leading edge
                Text(comment.commenterName)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .foregroundColor(.blue)
                
                Text(comment.text)
                    .padding(17)
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .background(.black.opacity(0.05))
                    .cornerRadius(30)
                    .padding(.bottom, 5)
            }
            
            Spacer() // Spacer to push the comment content to the left edge
        }
        .padding(.vertical, 5)
    }
}



