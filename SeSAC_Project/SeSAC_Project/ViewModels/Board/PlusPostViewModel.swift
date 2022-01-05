//
//  PlusPostViewModel.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import Foundation

class PlusPostViewModel {
    
    var plusPostText = Observable("")

    func fetchAddPost(completion: @escaping () -> Void) {
        PlusPostService.plusPost(text: plusPostText.value) { post, error in
            guard let post = post else {
                return print("게시글 작성 좀")
            }
            print("게시글 작성 굿")
            completion()
        }
    }
    
}
