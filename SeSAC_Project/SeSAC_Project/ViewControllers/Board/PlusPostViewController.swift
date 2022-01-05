//
//  PlusPostViewController.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import UIKit

class PlusPostViewController: UIViewController {
    
    let postView = PlusPostView()
    var postViewModel = PlusPostViewModel()
    
    override func loadView() {
        self.view = postView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigaionBar()
        
        
    }
    func initNavigaionBar() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc
      func leftBarButtonClicked() {
          navigationController?.popViewController(animated: true)
      }
      
      @objc
      func rightBarButtonClicked() {
          postViewModel.plusPostText.value = postView.textView.text
          postViewModel.fetchAddPost {
              DispatchQueue.main.async {
                  self.navigationController?.popViewController(animated: true)
                  print("살려주라 제발")
              }
          }
      }
      
  }
    
    
    

