//
//  OnboaringViewController.swift
//  onBoardingPage
//
//  Created by Student on 08/05/24.
//
import UIKit



extension UIImageView {
    func addRoundedBorder(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}

class OnboaringViewController: UIViewController {

    
    @IBOutlet weak var onboardImageViewOne: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        onboardImageViewOne.addRoundedBorder(radius: 20, borderWidth: 1, borderColor: UIColor.white)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
