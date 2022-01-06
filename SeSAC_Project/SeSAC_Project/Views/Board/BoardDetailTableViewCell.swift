//
//  BoardDetailTableViewCell.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import UIKit
import SnapKit
import Then

// 뷰의 구조 먼저 생각
// 있어야 할 것 : nicknameLabel, dateLabel, writeLabel, commentLabel, countLabel
// 추후 코멘트 조회에서 추가하기

class BoardDetailTableViewCell: UITableViewCell {
    
    static let identifier = "BoardDetailTableViewCell"
    
    let nicknameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let dateLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let writeLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }
    
    let commentLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
        $0.text = "댓글"
    }
    
    let countLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 10)
        $0.textAlignment = .left
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        nicknameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            
        }
    }
    
    func addContentView() {
        [nicknameLabel, dateLabel, writeLabel, commentLabel, countLabel].forEach {
            contentView.addSubview($0)
        }
    }

}
