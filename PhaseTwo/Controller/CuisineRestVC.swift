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
    @IBOutlet var searchBar: UISearchBar!
    
    
    private(set) public var cuisines = [Cuisine]()
    private(set) public var websites = ["https://www.grimaldispizzeria.com/", "http://www.pizzarocklasvegas.com/", "https://www.tripadvisor.com/Restaurant_Review-g45963-d3546867-Reviews-Secret_Pizza-Las_Vegas_Nevada.html"]

    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.delegate = self
       tableView.dataSource = self
       tableView.reloadData()
       tableView.separatorStyle = .none
        
        for subView in searchBar.subviews {
            for subViewInSubView in subView.subviews {
                if subViewInSubView.isKind(of: UITextField.self) {
            
                    subViewInSubView.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255255, alpha: 1)
                }
            }
        }
        
    }
    func initCuisine(cuisine: FoodType) {
        cuisines = DataService.instance.getCuisine(forCuisineName: cuisine.FoodType)
        navigationItem.title = cuisine.FoodType
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cuisines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CuisineRestCell", for: indexPath) as? CuisineRestCell {
            
            cell.imageName.clipsToBounds = true
            cell.imageName.layer.cornerRadius = cell.imageName.frame.height / 2
            
            let cuisine = cuisines[indexPath.row]
            cell.updateViews(cuisine: cuisine)
            
            return cell
            
        } else {
            
            return CuisineRestCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        book.backgroundColor = UIColor(red: 255/255, green: 149/255, blue: 0, alpha: 1)
        
        return [book]
        
    }

    

}






