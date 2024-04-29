//
//  TrendingPlaceCollectionViewCell.swift
//  TripEase
//
//  Created by student on 25/04/24.
//

import UIKit

class TrendingPlaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
}
