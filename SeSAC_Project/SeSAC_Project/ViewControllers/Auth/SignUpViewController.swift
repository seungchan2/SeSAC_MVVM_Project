//
//  SignUpViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/03.
//

import SnapKit
import UIKit

class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    var signUpViewModel = SignUpViewModel()
    
    override func loadView() {
        self.view = signUpView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        checkPassword()
    }
    
    func setData() {
        
        view.backgroundColor = .white
        signUpViewModel.username.bind { text in
                 self.signUpView.nicknameTextField.text = text
             }
        signUpViewModel.email.bind { text in
                 self.signUpView.emailTextField.text = text
             }
        signUpViewModel.password.bind { text in
                 self.signUpView.passwordTextField.text = text
             }
             
        signUpView.nicknameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.emailTextField.addTarget(self, action: #selector(usermailTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.signUpButton.addTarget(self, action: #selector(signupButtonClicked), for: .touchUpInside)
    }
    
    @objc
       func usernameTextFieldDidChange(_ textfield: UITextField) {
           signUpViewModel.username.value = textfield.text ?? ""
       }
       
       @objc
       func usermailTextFieldDidChange(_ textfield: UITextField) {
           signUpViewModel.email.value = textfield.text ?? ""
       }
       
       @objc
       func passwordTextFieldDidChange(_ textfield: UITextField) {
           signUpViewModel.password.value = textfield.text ?? ""
       }
       
       @objc
       func signupButtonClicked() {
           print("회원가입")
           print(signUpViewModel.username.value)
           print(signUpViewModel.email.value)
           print(signUpViewModel.password.value)
           

           DispatchQueue.main.async {
               if !self.signUpViewModel.checkError.value {
                   print("완료")
                   let vc = LoginViewController()
                   self.navigationController?.pushViewController(vc, animated: true)
                   guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                                                  windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                                                  windowScene.windows.first?.makeKeyAndVisible()
               } else {
                   print("회원가입 실패")
               }
           }
       }
            
       func checkPassword() {
           guard let password = signUpView.passwordTextField.text else { return }
           guard let passwordCheck = signUpView.passwordCheckTextField.text else { return }
           if password == passwordCheck {
               signUpView.signUpButton.isEnabled = true
           } else {
               signUpView.signUpButton.isEnabled = false
           }
       }
       
   }
   
    

