//
//  SignInView.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import UIKit
import SnapKit
import Then

class LoginView: UIView {
    
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일"
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
    
    let signInButton = UIButton().then {
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
        [emailTextField, passwordTextField, signInButton].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(40)
        }
        
        signInButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
}
