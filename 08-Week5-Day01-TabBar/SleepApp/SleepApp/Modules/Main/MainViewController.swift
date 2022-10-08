//
//  MainViewController.swift
//  SleepApp
//
//  Created by Armstrong on 05/10/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup(){
        tabBar.tintColor = UIColor(rgb: 0x8E97FD)
        tabBar.unselectedItemTintColor = UIColor(rgb: 0xA0A3B1)
    }

}
