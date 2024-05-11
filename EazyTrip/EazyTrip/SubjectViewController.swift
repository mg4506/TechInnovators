import UIKit

class SubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
  
    @IBOutlet weak var labelShowed: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedClass: String?
    var subjects = ["Trek Triumphs", "Solo Explorers", "Road Trip Lovers", "Budget Backpackers", "Historic Horizons","Luxe Ventures" ,"Family Funtastic", "Urban Odyssey", "Wanderlust Scholars", "Spiritual Seekers"]
    var filteredSubjects: [String] = [] // Filtered subjects based on search
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Community", style: .plain, target: nil, action: nil)
        // Configure collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Set up search bar
        searchBar.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearchBarEmpty() {
            return subjects.count
        } else {
            return filteredSubjects.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        
        let subject: String
        if isSearchBarEmpty() {
            subject = subjects[indexPath.item]
        } else {
            subject = filteredSubjects[indexPath.item]
        }
        
        cell.titleLabel.text = subject
        
        // Apply custom styling to cell
        cell.applyCustomStyle(for: subject)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection if needed
        let selectedSubject: String
            if isSearchBarEmpty() {
                selectedSubject = subjects[indexPath.item]
            } else {
                selectedSubject = filteredSubjects[indexPath.item]
            }

            // Create an instance of PostViewController
            let postViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostViewController") as! PostViewController

            // Pass the selected subject to PostViewController
            postViewController.navigationItem.title = selectedSubject
            postViewController.selectedSubject = selectedSubject
            // Push PostViewController onto the navigation stack
            navigationController?.pushViewController(postViewController, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust cell size as needed
        let totalWidth = collectionView.bounds.width
        let numberOfColumns: CGFloat = 3
        let cellWidth = (totalWidth - (numberOfColumns - 15) * 10) / numberOfColumns // Adjust spacing between cells (10) as needed
        let cellHeight: CGFloat = 100 // Adjust height as needed
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust spacing between cells horizontally
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Adjust spacing as needed
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterSubjects(for: searchText)
        collectionView.reloadData()
    }
    
    // MARK: - Helper methods
    
    func isSearchBarEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    func filterSubjects(for searchText: String) {
        filteredSubjects = subjects.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    // MARK: - ChooseCollectionDelegate
    
    func didSelectClass(_ selectedClass: String) {
        labelShowed.title = selectedClass
    }
    
    // MARK: - Navigation
    
}
