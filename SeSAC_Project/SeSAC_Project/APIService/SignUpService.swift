//
//  SignUpService.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/05.
//

import Foundation

class SignUpService {
    
    static func signup(username: String, email: String, password: String, completion: @escaping (SignUp?,APIError?) -> Void) {
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
                    let userData = try decoder.decode(SignUp.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .decodeFail)
                }
            }
            
        }.resume()
    }
}
