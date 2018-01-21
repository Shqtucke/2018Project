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
    private(set) public var websites = ["https://www.aria.com/en.html", "https://www.caesars.com/ballys-las-vegas", "https://www.bellagio.com/en.html"]

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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let book = UITableViewRowAction(style: .default, title: "website") { (action, index) in
            
            let url = URL(string: self.websites[indexPath.row])
            
            if let url = url {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
            
        }
        book.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        return [book]
        
    }

    

}






