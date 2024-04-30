//
//  CommunityViewController.swift
//  EazyTrip
//
//  Created by student on 30/04/24.
//

import UIKit

class CommunityViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var reviews: UITableView!
    
    struct UserReview {
        let name: String
        let date: String
        let location: String
        let heading: String
        let content: String
        let pfp: String
    }
    
    let data: [UserReview] = [
        UserReview(name: "Utkarsh Kohli", date: "20 April 2024", location: "Mysuru", heading: "Loved the Place!!!", content: "Utkarsh Kohli Review Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", pfp: "uPFPS"),
        UserReview(name: "Munish Goel", date: "23 April 2024", location: "Mysuru", heading: "Beautiful Place!!!", content: "Munish Goel Review Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", pfp: "mPFP"),
        UserReview(name: "Farhan Rayhan", date: "27 April 2024", location: "Mysuru", heading: "Budget Friendly Place!!!", content: "Farhan Rayhan Review Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", pfp: "fPFP"),
        UserReview(name: "Abhinav Kumar", date: "29 April 2024", location: "Mysuru", heading: "Good Place!!!", content: "Abhinave Kumar Review Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", pfp: "aPFP")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviews.dataSource = self
        reviews.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommunityTableViewCell
        cell.nameLabel.text = user.name
        cell.dateLabel.text = user.date
        cell.locationLabel.text = user.location
        cell.headingLabel.text = user.heading
        cell.contentReviewText.text = user.content
        cell.profileImageView.image = UIImage(named: user.pfp)
        return cell
    }
}
