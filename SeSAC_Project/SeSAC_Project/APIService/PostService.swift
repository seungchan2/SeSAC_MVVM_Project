//
//  PostService.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import Foundation

class PostService {

static func plusPost(text: String, completion: @escaping (Board?, APIError?) -> Void) {
        let url = URL(string: Const.URL.postURL)!
      
//        let token = UserDefaults.standard.string(forKey: "token")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = "text=\(text)".data(using: .utf8, allowLossyConversion: false)
        request.setValue("bearer " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUxLCJpYXQiOjE2NDE0MDM4MDMsImV4cCI6MTY0MTQwNTYwM30.Nck5Cpjkr9yNB9cIn6pZ-ijJB6VbmELW6jFGJlfMRrk", forHTTPHeaderField: "authorization")
        
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
                    let userData = try decoder.decode(Board.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .decodeFail)
                }
            }
        }.resume()
    }
    
    static func getPost(postId: Int, completion: @escaping (Board?, APIError?) -> Void) {
            let url = URL(string: Const.URL.postURL + "/\(postId)")!
          
    //        let token = UserDefaults.standard.string(forKey: "token")!
            var request = URLRequest(url: url)
       
            request.setValue("bearer " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUxLCJpYXQiOjE2NDE0MDM4MDMsImV4cCI6MTY0MTQwNTYwM30.Nck5Cpjkr9yNB9cIn6pZ-ijJB6VbmELW6jFGJlfMRrk", forHTTPHeaderField: "authorization")
            
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
                        let userData = try decoder.decode(Board.self, from: data)
                        completion(userData, nil)
                    } catch {
                        completion(nil, .decodeFail)
                    }
                }
            }.resume()
        }
}
