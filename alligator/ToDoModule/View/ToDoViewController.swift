//
//  ToDoViewController.swift
//  alligator
//
//  Created by Ayberk M on 22.09.2022.
//

import UIKit

class ToDoViewController: UIViewController, AddViewDelegate {
    func reloadTable() {
        viewModel.refreshData()
        self.tableView.reloadData()
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    var selectedIndex: Int?
    let viewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    

    @IBAction func addToDoButton(_ sender: Any) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "AddNewToDoViewController") as? AddNewToDoViewController
                       destinationVC?.isAdding = true
                       destinationVC?.delegate = self
                       self.navigationController?.pushViewController(destinationVC!, animated: true)
                       
    }
    
}

private extension ToDoViewController {
    func makeUI() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
    }
}



extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ToDoTableViewCell
        let item = viewModel.todoAtIndex(indexPath.row)
        cell.titleLabel.text = item.td_title
        if(item.td_isEvaluated == true) {
           cell.checkImage.image = UIImage(named: "checked")
        } else {
            cell.checkImage.image = UIImage(named: "unchecked")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //let todo = viewModel.todoAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        //performSegue(withIdentifier: "addToDoSegue", sender: tableView)
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "AddNewToDoViewController") as? AddNewToDoViewController
                       destinationVC?.isAdding = false
                       destinationVC?.delegate = self
                       destinationVC?.toDoObject = viewModel.todoAtIndex(selectedIndex!)
                       self.navigationController?.pushViewController(destinationVC!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteTask(indexPath.row) { (_) in
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
}



extension ToDoViewController: UIAdaptivePresentationControllerDelegate {
  
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
      tableView.reloadData()
    }
  }
  
}


