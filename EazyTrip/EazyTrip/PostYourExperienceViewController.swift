//
//  PostYourExperienceViewController.swift
//  EazyTrip
//
//  Created by student on 06/05/24.
//

import UIKit

class PostYourExperienceViewController: UIViewController {

    @IBOutlet weak var experience: UITextField!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var location: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
         // Perform any necessary validation of the input fields here
         
         // Create an instance of the destination view controller
        let displayVC = storyboard?.instantiateViewController(withIdentifier: "communitypostdata") as! CommunityViewController
                
                // Pass data to the next view controller
                displayVC.experienceText = experience.text
                displayVC.placeNameText = placeName.text
                displayVC.locationText = location.text
                
                // Present the next view controller
                self.navigationController?.pushViewController(displayVC, animated: true)
     }
    
}
