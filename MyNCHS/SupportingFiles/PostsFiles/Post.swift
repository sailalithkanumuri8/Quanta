//
//  Post.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 4/21/24.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let text: String
    let imageURL: URL?
    let ProfileImageURL: URL?
    var likes: Int
    var dislikes: Int
    var comments: [Comment]

    init(username: String, text: String, imageURL: URL?, ProfileImageURL: URL?, likes: Int = 0, dislikes: Int = 0, comments: [Comment] = []) {
        self.username = username
        self.text = text
        self.imageURL = imageURL
        self.ProfileImageURL = ProfileImageURL
        self.likes = likes
        self.dislikes = dislikes
        self.comments = comments
    }
}
