//
//  ExploreController.swift
//  EazyTrip
//
//  Created by student on 28/04/24.
//

import UIKit

class ExploreController: UIViewController {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryImageTwo: UIImageView!
    @IBOutlet weak var categoryLabelTwo: UILabel!
    
    
    @IBOutlet weak var categoryImageThree: UIImageView!
    @IBOutlet weak var categoryLabelThree: UILabel!
    
    
    @IBOutlet weak var categoryImageFour: UIImageView!
    @IBOutlet weak var categoryLabelFour: UILabel!
    
    @IBOutlet weak var recommend1: UIImageView!
    @IBOutlet weak var recommend2: UIImageView!
    @IBOutlet weak var recommend3: UIImageView!

    @IBOutlet weak var trend1: UIImageView!
    @IBOutlet weak var trend2: UIImageView!
    @IBOutlet weak var trend3: UIImageView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let imageViews: [UIImageView?] = [categoryImage, categoryImageTwo, categoryImageThree, categoryImageFour]
            let imageNames = ["mount", "beach", "crater", "waterfall"]
            
            for (index, imageView) in imageViews.enumerated() {
                if let imageView = imageView, let newCategoryImage = UIImage(named: imageNames[index]) {
                    imageView.image = newCategoryImage
                    imageView.layer.cornerRadius = imageView.frame.size.width / 2
                    imageView.clipsToBounds = true
                }
            }
            let labels: [UILabel?] = [categoryLabel, categoryLabelTwo, categoryLabelThree, categoryLabelFour]
            let labelTexts = ["Mountains", "Beaches", "Craters", "Waterfalls"]
            for (index, label) in labels.enumerated() {
                if let label = label {
                    label.text = labelTexts[index]
                }
            }
           
        recommend1.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        recommend2.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        recommend3.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        trend1.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        trend2.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)
        trend3.recommendRoundedBorder(radius: 15, borderWidth: 1, borderColor: .white)


           
        
    }
}
extension UIImageView {
    func recommendRoundedBorder(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}
