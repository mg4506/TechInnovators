//
//  EnterDetailsCenterViewController.swift
//  todolist
//
//  Created by student on 07/05/24.
//

import UIKit

class EnterDetailsCenterViewController: UIViewController {

    var imageName: String = ""
    
    
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var itinaryTextField: UITextField!
    @IBOutlet weak var itinaryDescriptionOneTextField: UITextField!
    @IBOutlet weak var itinaryDescriptionTwoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeImageView.image = UIImage(systemName: imageName)
    }

    @IBAction func didSubmit(_ sender: Any) {
        let newItinary = Itinery(imageName: imageName, name: itinaryTextField.text ?? "", descriptionOne: itinaryDescriptionOneTextField.text ?? "", descriptionTwo: itinaryDescriptionTwoTextField.text ?? "", isOn: false)
        itineries.insert(newItinary, at: 0)
        
        if let viewController = self.navigationController?.viewControllers.first(where: { $0 is TripDetailViewController }) as? TripDetailViewController {
                self.navigationController?.popToViewController(viewController, animated: false)
            }
    }
    
}
