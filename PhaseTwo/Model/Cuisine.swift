//
//  Cuisine.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import Foundation

struct Cuisine {
    private(set) public var imageName: String
    private(set) public var restName: String
    private(set) public var restLocate: String
    
    init(imageName: String, restName: String, restLocate: String) {
        self.imageName = imageName
        self.restName = restName
        self.restLocate = restLocate
    }
    
}
