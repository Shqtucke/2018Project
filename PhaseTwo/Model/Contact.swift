//
//  Contact.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/29/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class Contact: NSObject {

    let name: String
    let phone: String
    let imageName: String
    
    init(name: String, phone: String, imageName: String) {
        self.name = name
        self.phone = phone
        self.imageName = imageName
    }
}
