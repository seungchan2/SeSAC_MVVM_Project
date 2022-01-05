//
//  BoardViewModel.swift
//  SeSAC_Project
//
//  Created by 김승찬 on 2022/01/06.
//

import Foundation

class BoardViewModel {
    
    var board = Observable(Boards())
    var boardsDetail = Observable(Board(id: 0, text: "", user: BoardUser(id: 0, username: "", email: "", provider: Provider.local, confirmed: false, blocked: nil, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
       
       func fetchBoards(completion: @escaping () -> Void) {
           BoardService.board() { userData, error in
               guard let userData = userData else {
                   return
               }
               self.board.value = userData
               completion()
           }
       }
   }

   extension BoardViewModel {
       var numberOfRowInSection: Int {
           return board.value.count
       }
       
       func cellForRowAt(at indexPath: IndexPath) -> Board {
           return board.value[indexPath.row]
       }
   }
