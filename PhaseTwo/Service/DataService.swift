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
    FoodType(FoodType: "Pizza", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Burgers", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Italian", imageName: "pizza.jpeg"),
//    FoodType(FoodType: "Seafood", imageName: "seafood.jpeg"),
//    FoodType(FoodType: "French", imageName: "french.jpeg"),
//    FoodType(FoodType: "Mexican", imageName: "mexican.jpeg"),
//    FoodType(FoodType: "Steakhouse", imageName: "pizza.jpeg"),
//    FoodType(FoodType: "Chinese", imageName: "pizza.jpeg"),
//    FoodType(FoodType: "Sushi", imageName: "pizza.jpeg"),
//    FoodType(FoodType: "Deserts", imageName: "seafood.jpeg"),
//    FoodType(FoodType: "Brazilian", imageName: "french.jpeg"),
//    FoodType(FoodType: "Bar", imageName: "mexican.jpeg"),
    
    ]
    
    private let pizza = [
    Cuisine(imageName: "pizza.jpeg", restName: "Grimaldi's", restLocate: "Palazzo"),
    Cuisine(imageName: "pizza.jpeg", restName: "Pizza Rock", restLocate: "201 N. 3rd St"),
    Cuisine(imageName: "pizza.jpeg", restName: "Pizza Hut", restLocate: "113 Carrie Anderson")
    
    ]
    
    func getCuisine(forCuisineName cuisineName:String) -> [Cuisine] {
        switch cuisineName {
        case "Pizza":
            return getPizza()
        case "Burgers":
            return getPizza()
        case "Italian":
            return getPizza()
        default:
            return getPizza()
        }
    }
    
    func getPizza() -> [Cuisine] {
        return pizza 
    }
    
    func getFoodType() -> [FoodType] {
        return foodType
    }
    
}
