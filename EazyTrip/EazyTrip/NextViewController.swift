import UIKit

class NextViewController: UIViewController {
    
    var selectedImage: UIImage?
//    var nameTextField: UITextField!
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var emailTextField : UITextField!

//    var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here you can set up your NextViewController, for example:
        view.backgroundColor = .white
//        nameTextField = UITextField(frame: CGRect(x: 50, y: 450, width: 300, height: 40))
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
//        emailTextField = UITextField(frame: CGRect(x: 50, y: 500, width: 300, height: 40))
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.frame = CGRect(x: 25, y: 290, width: 100, height: 40)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitButton)
    }
    
//    @objc func submitButtonTapped() {
//        guard let name = nameTextField.text, let email = emailTextField.text else {
//            return
//        }
//
////        let detailsViewController = DetailsViewController()
////        detailsViewController.selectedImage = selectedImage
////        detailsViewController.name = name
////        detailsViewController.email = email
//////        detailsViewController.previousEmail = email // Pass the previous email
////        present(detailsViewController, animated: true, completion: nil)
//
//        if let tripDetailViewController = storyboard?.instantiateViewController(withIdentifier: "TripDetailViewController") as? TripDetailViewController {
//            tripDetailViewController.selectedImage = selectedImage
//
////                    present(tripDetailViewController, animated: true, completion: nil)
//            navigationController?.pushViewController(tripDetailViewController, animated: true)
//
//                }
//
//
//    }
    
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
