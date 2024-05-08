//
//  AddTripCenterViewController.swift
//  todolist
//
//  Created by student on 07/05/24.
//

import UIKit


class AddTripCenterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = imageTableVIew.dequeueReusableCell(withIdentifier: "typeImage", for: indexPath) as! AddTripCenterTableViewCell
        
        cell.imageName = images[indexPath.row]
        cell.imageView?.image = UIImage(systemName: images[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = imageTableVIew.cellForRow(at: indexPath) as? AddTripCenterTableViewCell
            performSegue(withIdentifier: "enterDetailsSegue", sender: cell)
    }
    
    
    var images:[String] = ["airplane", "bed.double", "car", "figure.walk", "figure.hiking"]

    @IBOutlet weak var imageTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTableVIew.dataSource = self
        imageTableVIew.delegate = self
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enterDetailsSegue" {
            if let destinationVC = segue.destination as? EnterDetailsCenterViewController {
                if let selectedIndexPath = imageTableVIew.indexPathForSelectedRow {
                    let selectedImageName = images[selectedIndexPath.row]
                    destinationVC.imageName = selectedImageName
                }
            }
        }
    }

}
