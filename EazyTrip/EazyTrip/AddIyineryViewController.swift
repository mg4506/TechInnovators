import UIKit

class AddItineryViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch category data (mocked for demonstration)
        let categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5"]
        
        // Create views for each category
        for category in categories {
            let categoryView = UIView()
            let label = UILabel()
            label.text = category
            label.textAlignment = .center
            categoryView.addSubview(label)
            // Add constraints for label within categoryView
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor)
            ])
            // Add categoryView to stackView
            stackView.addArrangedSubview(categoryView)
            
            // Add constraints for categoryView width and height
            categoryView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                categoryView.widthAnchor.constraint(equalToConstant: 200), // Adjust width as needed
                categoryView.heightAnchor.constraint(equalToConstant: 150) // Adjust height as needed
            ])
        }
        
        // Set content size of scroll view
        scrollView.contentSize = CGSize(width: CGFloat(categories.count) * 200, height: scrollView.frame.size.height)
    }
}
