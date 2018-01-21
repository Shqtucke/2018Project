//
//  CuisineRestCell.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class CuisineRestCell: UITableViewCell {
    
    
   
    @IBOutlet var imageName: UIImageView!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restLocation: UILabel!
    
    func updateViews(cuisine: Cuisine) {
        imageName.image = UIImage(named: cuisine.imageName)
        restaurantName.text = cuisine.restName
        restLocation.text = cuisine.restLocate
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
