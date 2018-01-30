//
//  AddContactVC.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/29/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var contactImgView: UIImageView!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var phoneTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextfield.delegate = self
        phoneTextfield.delegate = self
        
        nameTextfield.becomeFirstResponder()
        
        rounded(view: nameTextfield, radius: 5)
        rounded(view: phoneTextfield, radius: 5)
        rounded(view: contactImgView, radius: 50)
        
        }
    
    func rounded(view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.borderColor = #colorLiteral(red: 0.1014172509, green: 0.4798853993, blue: 0.9991846681, alpha: 1)
        view.layer.borderWidth = 3
        view.clipsToBounds = true 
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextfield.resignFirstResponder()
        phoneTextfield.resignFirstResponder()
        
        return true
    }

    @IBAction func selectPhoto(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage]
        contactImgView.image = image as? UIImage
    }
    
    @IBAction func saveContact(_ sender: Any) {
        
        if (nameTextfield.text?.isEmpty)! || (phoneTextfield.text?.isEmpty)! || contactImgView.image == nil {
            
            let alert = UIAlertController(title: "Message from Conceirge", message: "Please provide a name, phone number and a photo in order to continue", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            
            present(alert, animated: true)
            
            return
        }
    }
    
    
    
    
    
    
}






