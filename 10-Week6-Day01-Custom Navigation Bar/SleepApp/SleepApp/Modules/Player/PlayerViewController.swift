//
//  PlayerViewController.swift
//  SleepApp
//
//  Created by Armstrong on 15/10/22.
//

import UIKit
import AVKit

class PlayerViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: backButtonTapped
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: closeButtonTapped (Button Close / Dismis)
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension UIViewController {
    func presentPlayerViewController() {
        let storyboard = UIStoryboard(name: "Player", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "player") as! PlayerViewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        
        present(viewController, animated: true)
    }
    
    func showPlayerViewController() {
        let storyboard = UIStoryboard(name: "Player", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "player") as! PlayerViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
