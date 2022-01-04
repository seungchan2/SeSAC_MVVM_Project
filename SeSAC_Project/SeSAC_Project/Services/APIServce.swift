//
//  APIServce.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import Foundation

enum APIError {
    case failed
    case noData
    case errorCode
    case decodeFail
}

class APIService {
    
    //POST 수업시간에 배운 반복 내용 줄이는거 적용하기!
    static func signup(username: String, email: String, password: String, completion: @escaping (Login?,APIError?) -> Void) {
        let url = URL(string: Const.URL.signUpURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "username = \(username) & email= \(email) & password= \(password)".data(using: .utf8, allowLossyConversion: false)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .failed)
                    return
                }
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .failed)
                    return
                }
                if !(200...299).contains(response.statusCode) {
                    completion(nil, .errorCode)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(Login.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .decodeFail)
                }
            }
            
        }.resume()
    }
    
    static func login(email: String, password: String, completion: @escaping (Login?,APIError?) -> Void) {
        let url = URL(string: Const.URL.loginURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "identifier = \(email) & password = \(password)".data(using: .utf8, allowLossyConversion: false)
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .failed)
                    return
                }
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .failed)
                    return
                }

                if !(200...299).contains(response.statusCode) {
                    completion(nil, .errorCode)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(Login.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .decodeFail)
                }
            }
        }.resume()
    }
    
}
