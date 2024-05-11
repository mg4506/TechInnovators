import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar! // Add UISearchBar outlet
    
    
    var selectedSubject: String?
    var postsForSelectedSubject: [Posts] = []
    var filteredPosts: [Posts] = [] // Array to hold filtered posts
    let data: [String: [Posts]] = [
        "Trek Triumphs": [
            Posts(placeName: "Nice Place", message: "It is a very good place located at Mysuru and I love the place because of its nature in the world and also it's a nice phone.", profile: "uPFPS", personName:  "Utkkarsh Kohli", date: "20 April 2023", nameofplace: "Jaipur"),
            Posts(placeName: "Mysuru Palace", message: "It is a very good place located at Mysuru and I love the place because of its nature in the world and also it's a nice phone.", profile: "uPFPS", personName:  "Utkkarsh Kohli", date: "20 April 2023", nameofplace: "Mysuru"),
            // Add more posts for the English subject as needed
        ],
        "Solo Explorers": [
            Posts(placeName: "Nice Place", message: "It is a very good place located at Mysuru and I love the place because of its nature in the world and also it's a nice phone.", profile: "uPFPS", personName:  "Utkkarsh Kohli", date: "20 April 2023", nameofplace: "Mysuru"),
        ]
        // Add posts for other subjects
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        searchBar.delegate = self // Set delegate for the search bar
        if let selectedSubject = selectedSubject {
            if let posts = data[selectedSubject] {
                postsForSelectedSubject = posts
                filteredPosts = posts // Initialize filteredPosts with all posts initially
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPosts.count // Use filteredPosts for table view data source
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        let post = filteredPosts[indexPath.row] // Use filteredPosts for displaying data
        // Set cell content based on the selected post
        cell.placeName.text = post.placeName
        cell.messageLabel.text = post.message
        cell.profileImageView.image = UIImage(named: post.profile)
        cell.personName.text = post.personName
        cell.NameOfPlace.text = post.nameofplace
        cell.Date.text = post.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPosts = searchText.isEmpty ? postsForSelectedSubject : postsForSelectedSubject.filter { (post: Posts) -> Bool in
            // Filter based on placeName or nameofplace containing the search text
            return post.placeName.lowercased().contains(searchText.lowercased()) || post.nameofplace.lowercased().contains(searchText.lowercased())
        }
        table.reloadData() // Reload table view to reflect changes in filteredPosts
    }
}
