//
//  PostViewController.swift
//  PostScreenLast
//
//  Created by student on 01/05/24.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    struct Posts {
        let subject: String
        let message: String
        let profile: String
        let author: String
        let date:String
        let nameofplace:String
    }
    var selectedSubject: String?
    var postsForSelectedSubject: [Posts] = []
    let data: [String: [Posts]] = [
        "Trek Triumphs": [
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru")
            // Add more posts for the English subject as needed
        ],
        "Solo Explorers":[
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru"),
            Posts(subject: "Nice Place", message: "It is a very ggo dmbjbcfjbdfjbfbfjjrjf place located at mhysuru and i love the place beecause of its nature in thc world abnd  aldi bn nice phone ", profile: "uPFPS", author: "Utkkarsh Kohli", date: "20 april 2023", nameofplace: "Mysuru")
        ]
        // Add posts for other subjects
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNavigationBarHidden(false, animated: false)
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
        if let selectedSubject = selectedSubject {
                    if let posts = data[selectedSubject] {
                        postsForSelectedSubject = posts
                    }
                }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsForSelectedSubject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
                
                let post = postsForSelectedSubject[indexPath.row]
                
                // Set cell content based on the selected post
                cell.subjectLabel.text = post.subject
                cell.messageLabel.text = post.message
                cell.profileImageView.image = UIImage(named: post.profile)
                cell.authorLabel.text = post.author
                cell.NameOfPlace.text = post.nameofplace
                cell.Date.text = post.date
                
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
