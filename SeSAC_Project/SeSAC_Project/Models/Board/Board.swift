//
//  Board.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import Foundation

// MARK: - Board
struct Board: Codable {
    let id: Int
    let text: String
    let user: BoardUser
    let createdAt, updatedAt: String
    let comments: [Comment]

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case comments
    }
}

// MARK: - Comment
struct Comment: Codable {
    let id: Int
    let comment: String
    let user, post: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, comment, user, post
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct BoardUser: Codable {
    let id: Int
    let username, email: String
    let provider: Provider
    let confirmed: Bool
    let blocked: Bool?
    let role: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, username, email, provider, confirmed, blocked, role
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum Provider: String, Codable {
    case local = "local"
}

typealias Boards = [Board]
