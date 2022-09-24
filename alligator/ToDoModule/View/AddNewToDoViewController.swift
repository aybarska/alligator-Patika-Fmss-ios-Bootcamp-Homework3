//
//  AddNewToDoViewController.swift
//  alligator
//
//  Created by Ayberk M on 23.09.2022.
//

import UIKit

protocol AddViewDelegate {
    func reloadTable()
}

class AddNewToDoViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descTextArea: UITextView!
    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    var isAdding = true;
    var toDoObject: ToDo?
    var crDate = Date()
    
    var delegate: AddViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isAdding == false) {
            titleTextView.text = toDoObject?.td_title
            descTextArea.text = toDoObject?.td_description
            if(toDoObject?.td_isEvaluated == true) {
                isDoneSwitch.setOn(true, animated: true)
            } else {
                isDoneSwitch.setOn(false, animated: true)
            }
        }
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func saveButtonAction(_ sender: Any) {
        if(titleTextView.text != "") {
        if(isAdding) {
        let vm = AddNewToDoViewModel(td_title: titleTextView.text ?? "", td_createdDate: crDate, td_description: descTextArea.text, td_isEvaluated: isDoneSwitch.isOn)
            vm.saveTask()
             _ = navigationController?.popViewController(animated: true)
            self.delegate?.reloadTable()
        } else {
            let vm = AddNewToDoViewModel(td_title: titleTextView.text ?? "", td_createdDate: crDate, td_description: descTextArea.text, td_isEvaluated: isDoneSwitch.isOn)
                vm.uptadeTask(v: toDoObject!)
               _ = navigationController?.popViewController(animated: true)
                self.delegate?.reloadTable()
        }
        } else {
            let alert = UIAlertController(title: "Warning", message: "To do title cannot be empty.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
                 }))
            self.present(alert, animated: true, completion: nil)
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
