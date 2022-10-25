//
//  Restaurant.swift
//  FoodPin
//
//  Created by Armstrong on 20/10/22.
//

import Foundation
import UIKit
import MapKit

struct Restaurant {
    var name: String
    var category: String
    var address: String
    var phone: String
    var description: String
    var thumb: UIImage
    let latitude: Double
    let longitude: Double
    var imageObject: UIImage?
    
    init(name: String, category: String, address: String, phone: String, description: String, thumb: UIImage, latitude: Double, longitude: Double) {
        self.name = name
        self.category = category
        self.address = address
        self.phone = phone
        self.description = description
        self.thumb = thumb
        self.latitude = latitude
        self.longitude = longitude
        
    }
}
