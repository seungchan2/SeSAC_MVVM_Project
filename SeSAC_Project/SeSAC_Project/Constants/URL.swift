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
        
        // get Posts
        static let getPostURL = "\(baseURL)/posts"
        
        // plus Post (body)
        static let plusPostURL = "\(baseURL)/posts"
    }
}
