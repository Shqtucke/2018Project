//
//  FoodType.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import Foundation

struct FoodType {
    
    private(set) public var FoodType: String
    private(set) public var imageName: String
    
    init(FoodType: String, imageName: String) {
        self.FoodType = FoodType
        self.imageName = imageName
        
    }
}
