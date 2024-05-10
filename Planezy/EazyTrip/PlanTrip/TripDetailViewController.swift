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
//        let hexColor = "#2AA7ED"
        let itinary = itineries[indexPath.row]
        cell.typeNameLabel.text = itinary.name
        cell.typeImageView.image = UIImage(systemName: itinary.imageName)
        cell.descriptionTwo.text = itinary.descriptionTwo
        cell.descriptionOne.text = itinary.descriptionOne
        if(itinary.isOn){
            cell.typeImageView.backgroundColor = UIColor(hex: "#65C466")
            cell.switchStatus.isOn = true
            cell.connectingLine.backgroundColor = UIColor(hex: "#65C466")
        }
        else{
            cell.typeImageView.backgroundColor = UIColor(hex: "#2AA7ED")
            cell.switchStatus.isOn = false
            cell.connectingLine.backgroundColor = UIColor(hex: "#2AA7ED")
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
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
