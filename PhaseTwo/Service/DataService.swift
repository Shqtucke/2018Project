//
//  DataService.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private let foodType = [
    FoodType(foodType: "Pizza", imageName: "pizza.jpeg"),
    FoodType(foodType: "Burgers", imageName: "pizza.jpeg"),
    FoodType(foodType: "Italian", imageName: "pizza.jpeg"),
    FoodType(foodType: "Seafood", imageName: "seafood.jpeg"),
    FoodType(foodType: "French", imageName: "french.jpeg"),
    FoodType(foodType: "Mexican", imageName: "mexican.jpeg")
    
    
    ]
    
    func getFoodType() -> [FoodType] {
        return foodType
    }
    
}
