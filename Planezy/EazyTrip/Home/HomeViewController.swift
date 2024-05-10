import UIKit

extension UIImageView {
    func applyRoundedBorder(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}

class HomeViewController: UIViewController {
    @IBOutlet weak var planImage: UIImageView!
    @IBOutlet weak var recentImage1: UIImageView!
    @IBOutlet weak var recentImage2: UIImageView!
    @IBOutlet weak var recentImage3: UIImageView!
    @IBOutlet weak var traveltInspiration1: UIImageView!
    @IBOutlet weak var traveltInspiration2: UIImageView!
    @IBOutlet weak var traveltInspiration3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        planImage.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        recentImage1.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        recentImage2.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        recentImage3.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        traveltInspiration1.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        traveltInspiration2.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        traveltInspiration3.applyRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
    }
}
