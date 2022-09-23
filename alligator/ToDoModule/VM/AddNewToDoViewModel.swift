//
//  AddNewToDoViewModel.swift
//  alligator
//
//  Created by Ayberk M on 23.09.2022.
//

import Foundation


class AddNewToDoViewModel {
    var todoItem : ToDo?
    var td_title: String
    var td_description: String
    var td_createdDate: Date
    var td_isEvaluated: Bool
    
    init(td_title: String, td_createdDate: Date, td_description: String, td_isEvaluated: Bool) {
        self.td_title = td_title
        self.td_createdDate = td_createdDate
        self.td_description = td_description
        self.td_isEvaluated = td_isEvaluated
    }
    
    
    func saveTask() {
        CoreDataManager.shared.saveToDo(td_title: self.td_title, td_description: self.td_description, td_createdDate: self.td_createdDate, completion: self.td_isEvaluated)
  }
    
    func uptadeTask(v:ToDo) {
        CoreDataManager.shared.updateToDo(todoItem: v, td_title: self.td_title, td_description: self.td_description, td_isEvaluated: self.td_isEvaluated)
       
  }

}




