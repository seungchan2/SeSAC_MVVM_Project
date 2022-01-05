//
//  SignInViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/03.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    var loginViewModel = LoginViewModel()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .white
        loginViewModel.email.bind { text in
            self.loginView.emailTextField.text = text
        }
        
        loginViewModel.password.bind { text in
            self.loginView.passwordTextField.text = text
        }
        
        loginView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        loginView.signInButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func emailTextFieldDidChange(_ textfield: UITextField) {
        loginViewModel.email.value = textfield.text ?? ""
    }
    
    @objc
    func passwordTextFieldDidChange(_ textfield: UITextField) {
        loginViewModel.password.value = textfield.text ?? ""
    }
    
    @objc
    func signUpButtonClicked() {
        
        DispatchQueue.main.async {
            self.loginViewModel.fetchAPI()
            if !self.loginViewModel.checkError.value {
                print("다음 화면")
            } else {
                print("로그인 실패")
            }
        }
    }
    
}
