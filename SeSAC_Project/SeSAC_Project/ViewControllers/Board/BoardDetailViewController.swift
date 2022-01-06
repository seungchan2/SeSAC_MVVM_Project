//
//  BoardDetailViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import UIKit
import SnapKit
import Then

class BoardDetailViewController: UIViewController {

    // Cell -> 코멘트 / 댓글 2개 사용
    var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(BoardDetailTableViewCell.self, forCellReuseIdentifier: BoardDetailTableViewCell.identifier)
        $0.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
        $0.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
     
    }
    
    func setUI() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    

    

}


extension BoardDetailViewController: UITableViewDelegate {
    
}

extension BoardDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            // 댓글에 갯수 -> CommentViewModel의 댓글 부분을 가져와야함.
            // return값 고려, 만약 댓글이 없다면? 댓글을 입력해주세요 메세지도 괜찮을 듯!
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardDetailTableViewCell.identifier) as? BoardDetailTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
