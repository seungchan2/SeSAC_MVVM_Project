//
//  BoardService.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import Foundation

class BoardService {
    
    static func board(completion: @escaping (Boards?, APIError?) -> Void) {
        let url = URL(string: Const.URL.getPostURL)!
        
        // 로그인, 회원가입 때 저장한 토큰 사용
        // token 옵셔널 바인딩 에러
        
        // 우선 토큰을 직접 가져와서 사용 ... 에휴
//        let token = UserDefaults.standard.string(forKey: "token")!
        
        // 베어러 토큰, 헤더에 Authorization
        var request = URLRequest(url: url)
        request.setValue("bearer " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQ0LCJpYXQiOjE2NDEzOTkwMDIsImV4cCI6MTY0MTQwMDgwMn0.SQiieYDMpedrJnykM315ZIKoybb14I43uH4YiBKrrL0", forHTTPHeaderField: "authorization")
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
                    let userData = try decoder.decode(Boards.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .decodeFail)
                }
            }
            
        }.resume()
    }
}

