//
//  SignUpViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/03.
//

import SnapKit
import UIKit


// 수정해야 할 사항 -> 모든 텍스트필드가 차 있을 때만 버튼 활성화
// 현재는 그냥 버튼이 눌림..

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
           DispatchQueue.main.async {
               if !self.signUpViewModel.checkError.value {
                   let vc = LoginViewController()
                   self.navigationController?.pushViewController(vc, animated: true)
                   guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                                                  windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                                                  windowScene.windows.first?.makeKeyAndVisible()
               } else {
                   print("실패")
               }
           }
       }
            
       func checkPassword() {
           guard let email = signUpView.emailTextField.text?.isEmpty else { return }
           guard let nickname = signUpView.nicknameTextField.text?.isEmpty else { return }
           guard let password = signUpView.passwordTextField.text?.isEmpty else { return }
           guard let passwordCheck = signUpView.passwordCheckTextField.text?.isEmpty else { return }
    
           // 걍 뚤림.. 리팩토링 필요 ...
               if !email && !nickname && !password && !passwordCheck {
                   signUpView.signUpButton.isEnabled = true
           }
       }
       
   }
   
    

