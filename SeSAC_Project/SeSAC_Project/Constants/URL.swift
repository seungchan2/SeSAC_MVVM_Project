//
//  URL.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import Foundation

extension Const {
    struct URL {
        
        
        // base url
        static let baseURL = "http://test.monocoding.com:1231"
        
        // signUp
        
        static let signUpURL = "\(baseURL)/auth/local/register"
        
        // login
        static let loginURL = "\(baseURL)/auth/local"
        
        // change password
        static let changePasswordURL = "\(baseURL)/custom/change-password"
        
        // post와 comment가 공통적으로 쓰여서 Service URl 부분에서 추가만 해주면 될 듯?
        
        // get Posts
        static let postURL = "\(baseURL)/posts"
        
        // get Comments
        static let commentsURL = "\(baseURL)/comments"
        
    }
}
