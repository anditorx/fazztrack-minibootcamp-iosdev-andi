//
//  MainViewController.swift
//  Medic Meditation App
//
//  Created by Armstrong on 12/10/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        tabBar.tintColor = UIColor(red: 255, green: 255, blue: 255)
//        tabBar.unselectedItemTintColor = UIColor(rgb: 0xA0A3B1)
    }

}
