//
//  MainViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/03.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let mainView = MainView()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .white
        
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
        mainView.signInLabel.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signInLabelTapped))
        
        mainView.signInLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func signUpButtonClicked() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    @objc func signInLabelTapped(sender: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
}
