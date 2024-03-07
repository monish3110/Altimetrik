//
//  PostsModel.swift
//  Altimetrik
//
//  Created by Monish M on 06/03/24.
//

import Foundation

struct PostsModel: Codable {
    let posts: [PostDetailModel]
}

struct PostDetailModel: Codable,Identifiable {
    let id: String
    let author: AuthorModel
    let created: String
    let title: String
    let content: String
    let reactions: [Reactions]
}

struct AuthorModel: Codable {
    let nickName: String
    
    enum CodingKeys: String, CodingKey {
        case nickName = "nickname"
    }
    
}

struct Reactions: Codable {
    let count: Int
}
