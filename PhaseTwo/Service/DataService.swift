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
    
    private let website = [
    WebPages(website: "www.apple.com"),
    WebPages(website: "www.apple.com"),
    WebPages(website: "www.apple.com"),
    ]
    
    private let foodType = [
    FoodType(FoodType: "Pizza", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Burgers", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Italian", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Seafood", imageName: "seafood.jpeg"),
    FoodType(FoodType: "French", imageName: "french.jpeg"),
    FoodType(FoodType: "Mexican", imageName: "mexican.jpeg"),
    FoodType(FoodType: "Steakhouse", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Chinese", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Sushi", imageName: "pizza.jpeg"),
    FoodType(FoodType: "Deserts", imageName: "seafood.jpeg"),
    FoodType(FoodType: "Brazilian", imageName: "french.jpeg"),
    FoodType(FoodType: "Bar", imageName: "mexican.jpeg"),
    
    ]
    
    private let pizza = [
    Cuisine(imageName: "grimaldi.jpg", restName: "Grimaldi's", restLocate: "Palazzo"),
    Cuisine(imageName: "pizzaRoc.jpg", restName: "Pizza Rock", restLocate: "201 N. 3rd St"),
    Cuisine(imageName: "secret.jpg", restName: "Secret Pizza", restLocate: "Cosmopolitan Hotel")
    
    ]
    
    private let burgers = [
        Cuisine(imageName: "andresBistro.jpg", restName: "Andre's Bistro & Bar", restLocate: "Southwest"),
        Cuisine(imageName: "burgerBrass.jpg", restName: "Burger Brasserie", restLocate: "Paris Las Vegas"),
        Cuisine(imageName: "craftKitchen.jpg", restName: "Craft Kitchen", restLocate: "Henderson"),
        Cuisine(imageName: "gordonRams.jpg", restName: "Gordon Ramsey", restLocate: "Planet Hollywood"),
        Cuisine(imageName: "guyFieri.jpg", restName: "Guy Fieri's Vegas Kitchen & Bar", restLocate: "The LinQ"),
        Cuisine(imageName: "therapy.jpg", restName: "Therapy", restLocate: "Downtown")
    ]
    
    func getCuisine(forCuisineName cuisineName:String) -> [Cuisine] {
        switch cuisineName {
        case "Pizza":
            return getPizza()
        case "Burgers":
            return getBurgers()
        case "Italian":
            return getPizza()
        default:
            return getBurgers()
        }
    }
    
    func getWebsites() -> [WebPages] {
        return website
    }
    
    func getPizza() -> [Cuisine] {
        return pizza 
    }
    
    func getBurgers() -> [Cuisine] {
        return burgers
    }
    
    func getFoodType() -> [FoodType] {
        return foodType
    }
    
}
