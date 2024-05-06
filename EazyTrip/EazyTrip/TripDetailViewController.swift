import UIKit

class TripDetailViewController: UIViewController {
    var task: trip?
    var selectedImage: UIImage?
    var name: String?
    var email: String?
    var nameLabel: UILabel! // Declare nameLabel as a class property
    var emailLabel: UILabel! // Declare emailLabel as a class property
    var checkboxSwitch: UISwitch!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let task = task {
            descriptionLabel.text = task.description
            navigationItem.title = task.title
        }

        if let selectedImage = selectedImage {
            let imageView = UIImageView(image: selectedImage)
            imageView.contentMode = .scaleAspectFill
            imageView.frame = CGRect(x: 100, y: 150, width: 100, height: 100)
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
            view.addSubview(imageView)
        }

        nameLabel = UILabel(frame: CGRect(x: 200, y: 160, width: 300, height: 40))
        nameLabel.text = "Name: \(name ?? "")"
        view.addSubview(nameLabel)
        
        emailLabel = UILabel(frame: CGRect(x: 200, y: 180, width: 300, height: 40))
        emailLabel.text = "Email: \(email ?? "")"
        view.addSubview(emailLabel)
        
        // Checkbox switch
        checkboxSwitch = UISwitch(frame: CGRect(x: 16, y: 180, width: 50, height: 30))
        checkboxSwitch.addTarget(self, action: #selector(checkboxValueChanged(_:)), for: .valueChanged)
        view.addSubview(checkboxSwitch)
    }
    
    @objc func checkboxValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            nameLabel.textColor = .green // Change text color to green when checkbox is selected
            emailLabel.textColor = .green
        } else {
            nameLabel.textColor = .black // Reset text color when checkbox is deselected
            emailLabel.textColor = .black
        }
    }
}
