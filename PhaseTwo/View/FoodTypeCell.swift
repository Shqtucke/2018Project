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
    @IBOutlet var FoodTypeName: UILabel!
    
    func updateViews(FoodType: FoodType) {
        imageName.image = UIImage(named: FoodType.imageName)
        FoodTypeName.text = FoodType.FoodType
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15
        
    }
    
    
}
