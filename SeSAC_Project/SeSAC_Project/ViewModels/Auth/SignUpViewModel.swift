//
//  SignUpViewModel.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import Foundation

class SignUpViewModel {
    
    var username = Observable("")
    var email = Observable("")
    var password = Observable("")
    var checkError = Observable(false)
    
    func fetchSignup(username: String, email: String, password: String) {
        SignUpService.signup(username: username, email: email, password: password) { userData, error in
            guard let userData = userData else {
                self.checkError.value = true
                return
            }
            print("Signup Success")
            print(userData)
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            print(userData.jwt)
            
        }
    }
}

extension SignUpViewModel {
    func fetchAPI() {
        fetchSignup(username: username.value, email: email.value, password: password.value)
    }
}
