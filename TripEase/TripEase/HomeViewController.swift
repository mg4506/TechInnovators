//
//  HomeViewController.swift
//  TripEase
//
//  Created by student on 24/04/24.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    struct  place{
        let placeImage : String
        let placeName : String
        let placeLocation : String
    }
    
    let data : [place] = [
        place(placeImage: "image", placeName: "mysuru palace1", placeLocation: "Mysuru"),
        place(placeImage: "image1", placeName: "mysuru palace", placeLocation: "Mysuru"),
    place(placeImage: "image2", placeName: "mysuru palace", placeLocation: "Mysuru")
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrendTableViewCell
        cell.iconImageView.image = nil
        cell.placeLabel.text = place.placeName
        cell.placeLocation.text = place.placeLocation
        return cell
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
