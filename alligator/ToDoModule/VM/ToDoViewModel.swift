//
//  ToDoViewModel.swift
//  alligator
//
//  Created by Ayberk M on 22.09.2022.
//

import Foundation

protocol ToDoViewModelViewProtocol:AnyObject {
   // func didCellItemFetch(_ items: [ToDoCellViewModel])
    
    func showEmptyView()
    func hideEmptyView()
}


class ToDoViewModel {
//    private let model = ToDoModel()

    weak var viewDelegate: ToDoViewModelViewProtocol?
    
   func didViewLoad() {
        //model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        //let selectedItem = model.posts[index]
        //navigate ?
        //print(selectedItem)
    }
    
    var todos = [ToDo]()
       
       var count: Int {
           return todos.count
       }
       
       init() {
           self.refreshData()
       }
       
       func todoAtIndex(_ index: Int) -> ToDo {
           return todos[index]
       }
       
       func refreshData() {
           self.todos = CoreDataManager.shared.getAllTodos()
       }
       
       func completeTaskAtIndex(_ index: Int, completion: @escaping (Bool) -> Void) {
           self.refreshData()
           CoreDataManager.shared.completeTask(todo: todos[index], completion: completion)
       }
       
       func deleteTask(_ index: Int, completion: @escaping (Bool) -> Void) {
           CoreDataManager.shared.deleteTask(todo: todos[index]) { (_) in
               self.refreshData()
               completion(true)
           }
       }
    
    
}
