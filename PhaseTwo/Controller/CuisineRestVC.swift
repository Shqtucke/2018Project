//
//  cuisineRestVC.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit
import SafariServices

class CuisineRestVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    private(set) public var cuisines = [Cuisine]()

    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.delegate = self
       tableView.dataSource = self
       tableView.reloadData()
        
        
    }
    func initCuisine(cuisine: FoodType) {
        cuisines = DataService.instance.getCuisine(forCuisineName: cuisine.imageName)
        navigationItem.title = cuisine.imageName
    }
  

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cuisines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CuisineRestCell", for: indexPath) as? CuisineRestCell {
            
            
            let cuisine = cuisines[indexPath.row]
            cell.updateViews(cuisine: cuisine)
            
            return cell
            
        } else {
            
            return CuisineRestCell()
        }
        
    }

    

}






