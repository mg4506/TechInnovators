//
//  PlanViewController.swift
//  EazyTrip
//
//  Created by student on 01/05/24.
//

import UIKit

class PlanViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    struct Trips{
        let tripName: String
        let tripImage: String
        let tripDate: String
//        let daysLeft: UIButton
        
    }
    @IBOutlet weak var planTable:UITableView!
    let planData : [Trips] = [
    Trips(tripName: "Summer Plan", tripImage: "mysore", tripDate: "01 May 2024 - 03 May 2024") ,
    Trips(tripName: "Weakened Plan", tripImage: "mysore", tripDate: "01 May 2024 - 03 May 2024")
    
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plan = planData[indexPath.row]
        let cell = planTable.dequeueReusableCell(withIdentifier: "plancell", for: indexPath)as! PlanTableViewCell
        cell.planTitle.text=plan.tripName
        cell.planDate.text=plan.tripDate
        
        cell.planImage.image=UIImage(named: plan.tripImage)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        planTable.dataSource=self


    }
    

    
}
