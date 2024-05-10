import UIKit

class SubjectCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.center = contentView.center
    }
    func applyCustomStyle(for subject: String) {
        // Set up the layer properties
        layer.cornerRadius = 12
      
        layer.masksToBounds = false
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        // Set up the title label properties
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16) // Bold and font size 20

        // Customize background image view appearance with gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds // Adjusted to cover the entire cell
        
    
        // Set gradient colors based on subject
        switch subject {
        case "Trek Triumphs":
            gradientLayer.colors = [
                UIColor(hex: "#80bbf3").cgColor,
                UIColor(hex: "#1f85cb").cgColor
            ]
        case "Solo Explorers":
            gradientLayer.colors = [
                UIColor(hex: "#7fc1f1").cgColor,
                UIColor(hex: "#1f7acb").cgColor
            ]
        case "Road Trip Lovers":
            gradientLayer.colors = [
                UIColor(hex: "#7cc7f4").cgColor,
                UIColor(hex: "#1f80cd").cgColor
            ]
        case "Budget Backpackers":
            gradientLayer.colors = [
                UIColor(hex: "#7dc6f3").cgColor,
                UIColor(hex: "#1f85cb").cgColor
            ]
        case "Historic Horizons":
            gradientLayer.colors = [
                UIColor(hex: "#7bc3f2").cgColor,
                UIColor(hex: "#1f80cd").cgColor
            ]
        case "Family Funtastic":
            gradientLayer.colors = [
                UIColor(hex: "#7fc2f2").cgColor,
                UIColor(hex: "#1f7ccb").cgColor
            ]
        case "Urban Odyssey":
            gradientLayer.colors = [
                UIColor(hex: "#7fc1f2").cgColor,
                UIColor(hex: "#1f7acb").cgColor
            ]
        case "Wanderlust Scholars":
            gradientLayer.colors = [
                UIColor(hex: "#7dc5f2").cgColor,
                UIColor(hex: "#1f80cd").cgColor
            ]
        case "Spiritual Seekers":
            gradientLayer.colors = [
                UIColor(hex: "#7cc3f2").cgColor,
                UIColor(hex: "#1f7ccb").cgColor
            ]

        case "Luxe Ventures":
            gradientLayer.colors = [
                UIColor(hex: "#7cc4f2").cgColor,
                UIColor(hex: "#1f7ccb").cgColor
            ]
        default:
            gradientLayer.colors = [
                UIColor(hex: "#7cc4f2").cgColor,
                UIColor(hex: "#1f7ccb").cgColor
            ]
        }

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        backgroundImageView.layer.sublayers?.removeAll() // Remove existing sublayers
        backgroundImageView.layer.insertSublayer(gradientLayer, at: 0)

        // Center the title label
        titleLabel.sizeToFit() // Adjust the label's size to its content
        titleLabel.center = CGPoint(x: bounds.midX, y: bounds.midY) // Center the label within the cell
    }

}
//extension UIColor {
//    convenience init(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
//        var rgb: UInt64 = 0
//        
//        Scanner(string: hexSanitized).scanHexInt64(&rgb)
//        
//        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = CGFloat(rgb & 0x0000FF) / 255.0
//        
//        self.init(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}
