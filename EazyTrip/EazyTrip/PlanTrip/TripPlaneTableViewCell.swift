//
//  TripPlanTableViewCell.swift
//  todolist
//
//  Created by student on 07/05/24.
//

import UIKit

class TripPlanTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var descriptionOne: UILabel!
    @IBOutlet weak var descriptionTwo: UILabel!
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var connectingLine: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeImageView.layer.cornerRadius = typeImageView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func statusChanged(_ sender: Any) {
        
        if(switchStatus.isOn){
            self.typeImageView.backgroundColor = UIColor(hex: "#65C466")
            self.switchStatus.isOn = true
            self.connectingLine.backgroundColor = UIColor(hex: "#65C466")
        }
        else{
            self.typeImageView.backgroundColor = UIColor(hex: "#2AA7ED")
            self.switchStatus.isOn = false
            self.connectingLine.backgroundColor = UIColor(hex: "#2AA7ED")
        }
    }
    
}


