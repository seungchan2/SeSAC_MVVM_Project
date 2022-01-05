//
//  PlusPostView.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import UIKit
import SnapKit
import Then

class PlusPostView: UIView {
    
    let textView = UITextView().then {
        $0.font = .systemFont(ofSize: 14)
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setView() {
        self.addSubview(textView)
    }
    
    func setupConstraints() {
        textView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(100)
        }
    }
    
}
