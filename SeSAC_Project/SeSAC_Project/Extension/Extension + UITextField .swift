//
//  Extension + UITextField .swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/04.
//

import UIKit

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
