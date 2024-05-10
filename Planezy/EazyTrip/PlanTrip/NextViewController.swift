import UIKit

class NextViewController: UIViewController {
    
    var selectedImage: UIImage?
//    var nameTextField: UITextField!
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var emailTextField : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)

        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.frame = CGRect(x: 25, y: 290, width: 100, height: 40)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitButton)
    }
    @objc func submitButtonTapped() {
        // Ensure the submit button action is triggered
        print("Submit button tapped")
        // Ensure name and email fields have values
        guard let name = nameTextField.text, let email = emailTextField.text else {
            print("Name or email is nil")
            return
        }
//        print("Name: \(name), Email: \(email)")
        
        // If all values are present, proceed to instantiate TripDetailViewController
        if let tripDetailViewController = storyboard?.instantiateViewController(withIdentifier: "TripDetailViewController") as? TripDetailViewController {
            tripDetailViewController.selectedImage = selectedImage
            tripDetailViewController.name = name
            tripDetailViewController.email = email
            
            // Present or push the TripDetailViewController
            navigationController?.pushViewController(tripDetailViewController, animated: true)
        }
    }

}
