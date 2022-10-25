//
//  Restaurant.swift
//  FoodPin
//
//  Created by Bayu Yasaputro on 22/10/22.
//

import UIKit

class Restaurant {
    var name: String
    var category: String
    var address: String
    var phone: String
    var description: String
    var thumb: UIImage
    var rating: Rating?
    
    init(name: String, category: String, address: String, phone: String, description: String, thumb: UIImage, rating: Rating? = nil) {
        self.name = name
        self.category = category
        self.address = address
        self.phone = phone
        self.description = description
        self.thumb = thumb
        self.rating = rating
    }
}
