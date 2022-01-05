//
//  BoardTableViewCell.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/05.
//

import UIKit
import SnapKit
import Then

class BoardTableViewCell: UITableViewCell {
    
    static let identifier = "BoardTableViewCell"
    
    let nicknameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let writeLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    let dateLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let commentLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentView() {
        [nicknameLabel, dateLabel, writeLabel, commentLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setUI() {
        nicknameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
        }
        
        writeLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(writeLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
}
