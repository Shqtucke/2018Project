//
//  FoodTypeCell.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class FoodTypeCell: UICollectionViewCell {
    
    @IBOutlet var imageName: UIImageView!
    @IBOutlet var foodTypeName: UILabel!
    
    func updateViews(foodType: FoodType) {
        imageName.image = UIImage(named: foodType.imageName)
        foodTypeName.text = foodType.foodType
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15
        
    }
    
    
}
