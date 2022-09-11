//
//  ViewController.swift
//  Day01-Stackview-Exercise
//
//  Created by Armstrong on 10/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func firstButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Day 1", message: "Test Alert 1 : Day 1", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Day 1", message: "Test Alert 2 : Day 1", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
    @IBAction func thirdButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Day 1", message: "Test Alert 3 : Day 1", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Day 1", message: "Test Alert 4 : Day 1", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    
}

