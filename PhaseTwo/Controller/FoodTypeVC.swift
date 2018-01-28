//
//  FoodTypeVC.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class FoodTypeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
     private(set) public var FoodTypes = [FoodType]()
    @IBOutlet var restaurantCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantCollection.dataSource = self
        restaurantCollection.delegate = self
        
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getFoodType().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodTypeCell", for: indexPath) as? FoodTypeCell {
            
            
            
            let food = DataService.instance.getFoodType()[indexPath.row]
            cell.updateViews(FoodType: food)
            return cell
        }
        
        return FoodTypeCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
         let cuisine = DataService.instance.getFoodType()[indexPath.row]
        performSegue(withIdentifier: "FoodTypeCell", sender: cuisine)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cuisineVC = segue.destination as? CuisineRestVC {
            
            assert(sender as? FoodType != nil)
            cuisineVC.initCuisine(cuisine: sender as! FoodType)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }


    

}
