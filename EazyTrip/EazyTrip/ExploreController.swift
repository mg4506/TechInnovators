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
    
    ///Recommended
    @IBOutlet weak var recommendedImageOne: UIImageView!
    @IBOutlet weak var recommendedLabelOne: UILabel!
    
    @IBOutlet weak var recommendedImageTwo: UIImageView!
    @IBOutlet weak var recommendedLabelTwo: UILabel!
    
    @IBOutlet weak var recommendedImageThree: UIImageView!
    @IBOutlet weak var recommendedLabelThree: UILabel!
    
    
    @IBOutlet weak var recommendedImageFour: UIImageView!
    @IBOutlet weak var recommendedLabelFour: UILabel!
    
    
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
            
            let recommendImageViews: [UIImageView?] = [recommendedImageOne,recommendedImageTwo,recommendedImageThree,recommendedImageFour]
            let recommendImageNames = ["mysuru","hawamahal","brindavangarden","udaipurfinal"]
            
            for (index, recommendImageViews) in recommendImageViews.enumerated() {
                if let recommendImageViews = recommendImageViews, let newRecommendCategoryImage = UIImage(named: recommendImageNames[index]) {
                    recommendImageViews.image = newRecommendCategoryImage
                }
            }
        
            let recommendLabel : [UILabel?] = [recommendedLabelOne,recommendedLabelTwo,recommendedLabelThree,recommendedLabelFour]
            let recommendLabelText = ["Mysuru Palace","Hawa Mahal","Brindavan Gardens","Udaipur Fort"]
            
            for (index, recommendLabel) in recommendLabel.enumerated() {
                if let recommendLabel = recommendLabel {
                    recommendLabel.text = recommendLabelText[index]
                }
            }
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
