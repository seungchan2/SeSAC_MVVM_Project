//
//  CommentTableViewCell.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import UIKit
import SnapKit
import Then

class CommentTableViewCell: UITableViewCell {
    
    static let identifier = "CommentTableViewCell"
    
    let nicknameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let commentLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    let editButton = UIButton().then {
        $0.setImage(UIImage(systemName: "ellipsis.vertical.bubble"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        nicknameLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(20)
        }
        
        commentLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(30)
        }
    }
    
}
