//
//  SignInViewModel.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import Foundation

class LoginViewModel {

    var email = Observable("")
    var password = Observable("")
    var checkError = Observable(false)

    func fetchLogin(email: String, password: String) {
        LoginService.login(email: email, password: password) { userData, error in
            guard let userData = userData else {
                self.checkError.value = true
                return
            }
            UserDefaults.standard.set(userData.jwt, forKey: "token")
        }
    }
}

extension LoginViewModel {
    func fetchAPI() {
        fetchLogin(email: email.value, password: password.value)
    }
}
