//
//  AddNewToDoViewController.swift
//  alligator
//
//  Created by Ayberk M on 23.09.2022.
//

import UIKit

class AddNewToDoViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descTextArea: UITextView!
    @IBOutlet weak var titleTextView: UITextField!
    var isAdding = true;
    var toDoObject: ToDo?
    var crDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isAdding == false) {
            titleTextView.text = toDoObject?.td_title
            descTextArea.text = toDoObject?.td_description
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonAction(_ sender: Any) {
        if(isAdding) {
        let vm = AddNewToDoViewModel(td_title: titleTextView.text ?? "", td_createdDate: crDate, td_description: descTextArea.text, td_isEvaluated: true)
            vm.saveTask()
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        
        } else {
            let vm = AddNewToDoViewModel(td_title: titleTextView.text ?? "", td_createdDate: crDate, td_description: descTextArea.text, td_isEvaluated: true)
                vm.uptadeTask(v: toDoObject!)
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
