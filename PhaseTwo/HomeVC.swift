//
//  ViewController.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet var menuButtons: [UIButton]!
    
    @IBOutlet var viewConstraint: NSLayoutConstraint!
    @IBOutlet var sideView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 1
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        viewConstraint.constant = -125
        
        for button in menuButtons {
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowOffset = CGSize(width: 0.1, height: 0)
        }
    }

    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 {     //swipe right
                
                if viewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
                
            } else {              //swipe left
                
                if viewConstraint.constant > -123 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended {
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.viewConstraint.constant = -123
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    


}

