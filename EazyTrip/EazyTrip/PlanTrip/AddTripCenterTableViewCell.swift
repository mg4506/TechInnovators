//
//  AddTripCenterTableViewCell.swift
//  todolist
//
//  Created by student on 07/05/24.
//

import UIKit

class AddTripCenterTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    var imageName: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeImageView.frame.size.width += 20 // Adjust width as needed
            typeImageView.frame.size.height += 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
