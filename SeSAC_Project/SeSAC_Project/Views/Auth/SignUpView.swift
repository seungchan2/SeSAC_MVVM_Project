//
//  SinUpView.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import UIKit
import SnapKit
import Then

class SignUpView: UIView {
    
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.addLeftPadding()
    }

    let nicknameTextField = UITextField().then {
        $0.placeholder = "닉네임"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.addLeftPadding()
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let passwordCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let signUpButton = UIButton().then {
        $0.backgroundColor = .systemGreen
        $0.setTitle("가입하기", for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        [emailTextField, nicknameTextField, passwordTextField, passwordCheckTextField, signUpButton].forEach {
           addSubview($0)
        }
    }
    
    func setConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
    }
    
}

