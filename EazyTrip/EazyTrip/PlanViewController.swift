//
//  ViewController.swift
//  todolist
//
//  Created by student on 01/05/24.
//

import UIKit

struct trip{
    var title: String
    var description: String
    
}
class PlanViewController: UIViewController  {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    var task = [trip]()
    var filteredTasks = [trip]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        searchBar.delegate=self
        //set
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }
        
        updateTasks()
    }
    func updateTasks() {
        task.removeAll()
        print("UpdateTasks")
        print("\(task.count)")
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        print("count: \(count)")
        for x in 0..<count {
            if let title = UserDefaults().value(forKey: "task_\(x+1)") as? String,
               let description = UserDefaults().value(forKey: "task2_\(x+1)desc") as? String {
                let newTrip = trip(title: title, description: description)
                task.append(newTrip)
                print("\(title) : \(description)")
            }
        }
        filteredTasks = task

        tableView.reloadData()
    }
    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
//        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async{
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
    }


}
extension PlanViewController:UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = filteredTasks[indexPath.row]
        // Assuming you have a detail view controller named TaskDetailViewController
        let detailVC = storyboard?.instantiateViewController(identifier: "TripDetailViewController") as! TripDetailViewController
        detailVC.task = selectedTask // Pass the selected task to the detail view controller
        navigationController?.pushViewController(detailVC, animated: true
        )
    }
}
extension PlanViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return task.count
        return filteredTasks.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = task[indexPath.row]
//        return cell
//    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let currentTrip = filteredTasks[indexPath.row]

            cell.textLabel?.text = currentTrip.title
            cell.detailTextLabel?.text = currentTrip.description

            return cell
    }

    
    
}

extension PlanViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let normalizedSearchText = searchText.lowercased()
        filteredTasks = searchText.isEmpty ? task : task.filter {
            let normalizedTitle = $0.title.lowercased()
            return normalizedTitle.contains(normalizedSearchText)
        }
        tableView.reloadData()
    }
}


