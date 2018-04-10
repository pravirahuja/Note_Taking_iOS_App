//
//  AddTaskViewController.swift
//  CoreToDo
//
//  Created by Pravir on 10/04/18.
//  Copyright © 2018 Pravir. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImportantSwitch: UISwitch!
    @IBOutlet weak var taskInfoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        self.hideKeyboardWhenTappedAround()
        self.navigationItem.title = "Create A Note"
    }
// when you want to interact with the database you have to create a context. This context is going to take your data to the database/is gonna fetch the data from the database to your views or gonna save/delete that (i.e., do the CRUD stuff)
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        
        if let text = textField.text, !text.isEmpty, !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty{
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            //Task--> refering to the entity in CoreData
            let task = Task(context: context)
            
            //check if that textfield and textArea is filled or empty: can grey out the Add task button until some text has been added or can do a if let check
            task.name = text
            task.isImportant = isImportantSwitch.isOn
            task.info = taskInfoTextView.text
        }else{
            textField.text = ""
            return
        }
        
        //save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 10
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
