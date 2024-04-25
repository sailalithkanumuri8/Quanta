//
//  PostView.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 4/21/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    let post: Post
    @Binding var posts: [Post]
    @Binding var newCommentText: String
    @Binding var selectedPost: Post?
    @Binding var showComments: Bool
    
    @State private var likeSelected = false
    @State private var dislikeSelected = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if let profileImageURL = post.ProfileImageURL {
                    // Display post profile picture if available
                    WebImage(url: profileImageURL)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                Text(post.username)
                    .font(Font.custom("Quicksand-Bold", size: 15))
            }
            Text(post.text)
                .padding(.bottom, 4)
                .font(Font.custom("Quicksand-Regular", size: 15))
            
            if let postImageURL = post.imageURL {
                WebImage(url: postImageURL)
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Button(action: {
                    if likeSelected {
                        posts[posts.firstIndex(where: { $0.id == post.id })!].likes -= 1
                    } else {
                        posts[posts.firstIndex(where: { $0.id == post.id })!].likes += 1
                    }
                    likeSelected.toggle()
                    dislikeSelected = false
                }) {
                    Image(systemName: likeSelected ? "hand.thumbsup.fill" : "hand.thumbsup")
                }
                .padding(.trailing, 3)
                
                Text("\(post.likes)")
                    .font(Font.custom("Quicksand-Medium", size: 15))
                    .padding(.trailing, 20)
                
                Button(action: {
                    if dislikeSelected {
                        posts[posts.firstIndex(where: { $0.id == post.id })!].dislikes -= 1
                    } else {
                        posts[posts.firstIndex(where: { $0.id == post.id })!].dislikes += 1
                    }
                    dislikeSelected.toggle()
                    likeSelected = false
                }) {
                    Image(systemName: dislikeSelected ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                }
                .padding(.trailing, 3)
                
                Text("\(post.dislikes)")
                    .font(Font.custom("Quicksand-Medium", size: 15))
                
                Spacer()
                
                Button {
                    selectedPost = post
                    showComments.toggle()
                } label: {
                    HStack {
                        Text("\(post.comments.count)")
                            .font(Font.custom("Quicksand-Medium", size: 15))
                        
                        Text("Comments")
                            .font(Font.custom("Quicksand-Medium", size: 15))
                            .offset(x: -2)
                    }
                }
            }
            
            if showComments && selectedPost?.id == post.id {
                CommentsView(post: post, posts: $posts, text: $newCommentText)
                    .padding(.top, 10)
            } else {
                if let firstComment = post.comments.first {
                    Text("\(firstComment.commenterName): \(firstComment.text)")
                        .font(Font.custom("Quicksand-Medium", size: 15))
                        .foregroundColor(Color("Color"))
                        .onTapGesture {
                            selectedPost = post
                            showComments.toggle()
                        }
                        .padding(.top, 10)
                }
            }
            
            Spacer()
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
    }
}





