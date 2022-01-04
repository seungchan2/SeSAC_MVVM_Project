//
//  Login.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let jwt: String
    let user: LoginUser
}

// MARK: - LoginUser
struct LoginUser: Codable {
    let id: Int
    let username, email: String
}
