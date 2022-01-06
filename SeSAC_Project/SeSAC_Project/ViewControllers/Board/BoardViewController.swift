//
//  BoardViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/05.
//

import UIKit
import SnapKit
import Then

class BoardViewController: UIViewController {
    
    var boardViewModel = BoardViewModel()
    
    var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
    }
    
    // 테이블뷰를 BoardView에 만들어서 사용하고 싶었는데 ..
    let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        assignDelegation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        boardViewModel.fetchBoards {
            self.tableView.reloadData()
        }
    }
    
    func setUI() {
        view?.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-18)
            $0.height.width.equalTo(40)
        }
    }
    
    func assignDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func plusButtonClicked() {
        print("ButtonClick!")
        let viewController = PlusPostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension BoardViewController: UITableViewDelegate {
    
}

extension BoardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardViewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.identifier) as? BoardTableViewCell else { return UITableViewCell() }
        
        let row = boardViewModel.cellForRowAt(at: indexPath)
        cell.nicknameLabel.text = row.user.username
        cell.writeLabel.text = row.text
        cell.dateLabel.text = row.createdAt
        cell.countLabel.text = "\(row.comments.count)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = BoardDetailViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}
