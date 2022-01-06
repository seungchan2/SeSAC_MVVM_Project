//
//  CommentViewModel.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//


import Foundation

class CommentViewModel {
    
    var id = Observable(0)
    var comment = Observable(CommentFind())
    
    func fetchCommentFind(completion: @escaping () -> Void) {
        APIService.inquireComment(id: self.id.value) { comment, error in
            guard let comment = comment else {
                return
            }
            self.comment.value = comment
            completion()
        }
    }
    
}
