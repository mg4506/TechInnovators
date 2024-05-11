//
//  EntryViewController.swift
//  todolist
//
//  Created by student on 01/05/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var field: UITextField!
    @IBOutlet var field2: UITextField!
    var update: (()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        field2.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savedTask))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        savedTask()
        return true
        
    }

    @objc func savedTask() {
        guard let text1 = field.text, !text1.isEmpty else {
            return
        }
        guard let text2 = field2.text, !text2.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newcount = count + 1
        UserDefaults().set(newcount, forKey: "count")
        UserDefaults().set(text1, forKey: "task_\(newcount)")
        UserDefaults().set(text2, forKey: "task2_\(newcount)desc") // Adjusted key for the second task
        
        
        update?()
        print("Value set: \(text1):\(text2)")
        navigationController?.popViewController(animated: true)
    }


}
