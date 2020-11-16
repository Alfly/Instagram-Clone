//
//  Models.swift
//  Instagram
//
//  Created by Alfly on 2020/11/14.
//  Copyright © 2020 Alfly. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User{
    let username: String
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImag: URL                  // 缩略图
    let postURL: URL                        // vedio or full resolution photo
    let caption: String?
    let likeCont: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggerUsers: [String]
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}

