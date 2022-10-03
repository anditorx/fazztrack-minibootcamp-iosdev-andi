//
//  CoffeeShop.swift
//  Tugas_TableView
//
//  Created by Armstrong on 26/09/22.
//

import Foundation

struct CoffeeShop {
    let name: String?
    let thumbnails: String?
    let prepTime: String?
    
    init(name: String?, thumbnails: String?, prepTime: String?){
        self.name = name
        self.thumbnails = thumbnails
        self.prepTime = prepTime
    }
    
}
