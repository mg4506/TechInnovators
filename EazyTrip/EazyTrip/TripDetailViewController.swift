import UIKit

struct Itinery{
    var imageName: String
    var name:String
    var descriptionOne:String
    var descriptionTwo:String
    var isOn:Bool
}

var itineries: [Itinery] = []

class TripDetailViewController: UIViewController , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itineries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itinerayTableView.dequeueReusableCell(withIdentifier: "tripItinerayCell", for: indexPath) as! TripPlanTableViewCell
        
        let itinary = itineries[indexPath.row]
        cell.typeNameLabel.text = itinary.name
        cell.typeImageView.image = UIImage(systemName: itinary.imageName)
        cell.descriptionTwo.text = itinary.descriptionTwo
        cell.descriptionOne.text = itinary.descriptionOne
        if(itinary.isOn){
            cell.typeImageView.backgroundColor = .green
            cell.switchStatus.isOn = true
            cell.connectingLine.backgroundColor = .green
        }
        else{
            cell.typeImageView.backgroundColor = .blue
            cell.switchStatus.isOn = false
            cell.connectingLine.backgroundColor = .blue
        }
        if(indexPath.row == itineries.count - 1){
            cell.connectingLine.isHidden = true
        } else {
            cell.connectingLine.isHidden = false
        }
        return cell
    }
    
    
    var task: trip?
    var selectedImage: UIImage?
    var name: String?
    var email: String?
    var nameLabel: UILabel! // Declare nameLabel as a class property
    var emailLabel: UILabel! // Declare emailLabel as a class property
    var checkboxSwitch: UISwitch!
    
    @IBOutlet weak var itinerayTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = task {
            descriptionLabel.text = task.description
            navigationItem.title = task.title
        }
        itinerayTableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        itinerayTableView.reloadData()
    }
    @IBAction func didTapPlus(_ sender: Any) {
        performSegue(withIdentifier: "selectTypeImageSegue", sender: self)
    }
    
}
