//
//  WelcomeViewController.swift
//  SleepApp
//
//  Created by Armstrong on 02/10/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var startedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        startedButton.layer.cornerRadius = 20
        startedButton.layer.masksToBounds = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func startedButtonTapped(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
        
        let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let window = scene.windows.first!
        window.rootViewController = viewController
        
    }
    
}
