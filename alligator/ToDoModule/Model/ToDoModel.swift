//
//  ToDoModel.swift
//  alligator
//
//  Created by Ayberk M on 22.09.2022.
//

import Foundation


//MARK:- Data Model for a single item
struct ToDoModel {
    let td_title: String
    let td_description: String
    let td_isEvaluated: Bool
    let td_createdDate: Date

    
    init(td_title: String, td_description: String,td_isEvaluated: Bool,td_createdDate: Date) {
      self.td_title = td_title
      self.td_description = td_description
      self.td_isEvaluated = td_isEvaluated
        self.td_createdDate = td_createdDate

    }
    
    
}
