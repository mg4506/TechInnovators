//
//  ExploreController.swift
//  EazyTrip
//
//  Created by student on 28/04/24.
//

import UIKit

class ExploreController: UIViewController {

    @IBOutlet weak var categoryImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newCategoryImage = UIImage(named: "Image") {
            categoryImage.image = newCategoryImage
            
            // Make the image view round
            categoryImage.layer.cornerRadius = categoryImage.frame.size.width / 2
            categoryImage.clipsToBounds = true
        }

        // Do any additional setup after loading the view.
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
