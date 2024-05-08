//
//  CreateAccountViewController.swift
//  onBoardingPage
//
//  Created by Student on 08/05/24.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var goToLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func tapAndGoToLogin(_ sender: Any) {
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
