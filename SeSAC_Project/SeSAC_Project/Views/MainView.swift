//
//  MainView.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/03.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    
    let mainImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "logo_ssac_clear")
    }
    
    let logoTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.text = "당신 근처의 새싹 농장"
        $0.textAlignment = .center
    }
    
    let logoSubtitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.text = "iOS 지식부터 바람의 나라까지\n 지금 SeSAC에서 함께해보세요!"
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let signUpButton = UIButton().then {
        $0.backgroundColor = .systemGreen
        $0.tintColor = .white
        $0.setTitle("회원가입", for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    let signInStackView = UIStackView().then {         $0.distribution = .fillProportionally
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 8
    }
    
    let signInInfoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
        $0.text = "이미 계정이 있다면?"
    }
    
    let signInLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .systemGreen
        $0.text = "로그인"
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
        [mainImageView, logoTitleLabel, logoSubtitleLabel, signUpButton, signInStackView].forEach {
           addSubview($0)
        }
      
        [signInInfoLabel, signInLabel].forEach {
            signInStackView.addArrangedSubview($0)
        }
    }
    
    func setConstraints() {
        mainImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.8)
            $0.height.width.equalTo(100)
        }
        
        logoTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(mainImageView).inset(-30)
            $0.top.equalTo(mainImageView.snp.bottom).offset(10)
        }
        
        logoSubtitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(logoTitleLabel)
            $0.top.equalTo(logoTitleLabel.snp.bottom).offset(5)
        }
        
        signUpButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(signInStackView.snp.top).offset(-20)
            $0.height.equalTo(44)
        }
        
        signInStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(20)
        }
    }
}
