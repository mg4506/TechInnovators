//
//  PlanCellTableViewCell.swift
//  EazyTrip
//
//  Created by student on 09/05/24.
//

import UIKit

class PlanCellTableViewCell: UITableViewCell {
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet var planImageView: UIImageView!
    
    @IBOutlet var recommendImgTwo: UIImageView!
    @IBOutlet var recommendImgOne: UIImageView!
    
    @IBOutlet var toggleButton: UIButton!
    @IBOutlet var scrollview: UIScrollView!
    var isScrollViewVisible = false

    override func awakeFromNib() {
        super.awakeFromNib()
        recommendImgOne.layer.cornerRadius = 15
        recommendImgTwo.layer.cornerRadius = 15

        planImageView.layer.cornerRadius = 15
        scrollview.isHidden = true

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func toggleScrollView(_ sender: UIButton) {
           // Toggle the visibility of the scroll view
           scrollview.isHidden = !scrollview.isHidden
           
           // Update button title based on scroll view visibility
           let buttonTitle = scrollview.isHidden ? "Show Details" : "Hide Details"
           toggleButton.setTitle(buttonTitle, for: .normal)
       }

}
