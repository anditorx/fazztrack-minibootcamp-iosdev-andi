//
//  CoffeeShop.swift
//  Tugas_TableView
//
//  Created by Armstrong on 26/09/22.
//

import Foundation

struct CoffeeShop {
    let name: String?
    let type: String?
    let location: String?
    let image: String?
    var isFavorite: Bool = false
    
    init(name: String?, type: String?, location: String?, image: String?, isFavorite: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
    }
    
}
