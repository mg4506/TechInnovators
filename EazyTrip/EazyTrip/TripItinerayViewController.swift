import UIKit

class TripItnerayViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var selectedImageView: UIImageView! // Outlet for displaying tapped image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageNames = ["airplane", "hotel", "cab", "meeting", "restaurant"] // Names of your images
        
//        stackView.distribution = .fill
        
        for imageName in imageNames {
            let categoryView = UIView()
            
            if let image = UIImage(named: imageName) {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.layer.cornerRadius = imageView.frame.width / 2
                imageView.clipsToBounds = true
                categoryView.addSubview(imageView)
                selectedImageView.image = image
                
                NSLayoutConstraint.activate([
                    imageView.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
                    imageView.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor),
//                    imageView.widthAnchor.constraint(equalToConstant: 200),
//                    imageView.heightAnchor.constraint(equalToConstant: 250)
                    
                    imageView.widthAnchor.constraint(equalToConstant: 250), // Adjust the width as needed
                        imageView.heightAnchor.constraint(equalToConstant: 250)
                ])
                
                // Add tap gesture recognizer
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGestureRecognizer)
                
                stackView.addArrangedSubview(categoryView)
                categoryView.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(imageNames.count) * 200, height: scrollView.frame.size.height)
    }
    
    @objc func imageTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let imageView = gestureRecognizer.view as? UIImageView,
              let image = imageView.image else {
            return
        }
        
        // Set the tapped image to the selectedImageView
        selectedImageView.image = image
        
        // Handle navigation to the next screen if needed
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController {
            nextViewController.selectedImage = image
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
