//
//  HomeViewController.swift
//  Medic Meditation App
//
//  Created by Armstrong on 12/10/22.
//
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    //menu
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return 2
        }
        else {
            return 1
        }
    }
    
    // meditation card
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            if section == 0 {
                return 1
            }else{
                return 2
            }
        }
        else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {

            if indexPath.section == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuhorizontal", for: indexPath) as! MenuHorizontalViewCell
                    
                
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                
                return cell
            }
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionBox01", for: indexPath) as! HomeCollectionViewCell
                
                let item = indexPath.item
               
                cell.layer.cornerRadius = 20
                cell.layer.masksToBounds = true
                cell.titleLabel.text = item == 0 ? "Meditation 101" : "Cardio Meditation"
                cell.descLabel.text = item == 0 ? "Techniques, Benefits, and a Beginner’s How-To" : "Basics of Yoga for Beginners or Experienced Professionals"
                cell.imageCollectionBox.image = item == 0 ? UIImage(named: "meditation101") :  UIImage(named: "meditation2")
                
                return cell
            }
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menubox", for: indexPath) as! MenuViewCell
            
            let index = indexPath.row
            print("hei \(index)")
            switch index {
            case 0:
                cell.imageView.image = UIImage(named: "ic_calm")
                cell.titleMenuLabel.text = "Calm"
            case 1:
                cell.imageView.image =  UIImage(named: "ic_relax")
                cell.titleMenuLabel.text = "Relax"
            case 2:
                cell.imageView.image =  UIImage(named: "ic_focus")
                cell.titleMenuLabel.text = "Focus"
            case 3:
                cell.imageView.image =  UIImage(named: "ic_anxious")
                cell.titleMenuLabel.text = "Anxious"
            default:
                cell.imageView.image =  UIImage(named: "ic_calm")
                cell.titleMenuLabel.text = "Calm"
            }
            
            return cell

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        let img = view.viewWithTag(103) as! UIImageView
        let welcomeLabel = view.viewWithTag(100) as! UILabel
        let askLabel = view.viewWithTag(101) as! UILabel

        if indexPath.section == 0 {
            welcomeLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            welcomeLabel.isHidden = false
            welcomeLabel.text = "Welcome back, Andi!"
            askLabel.text = "How are you feeling today?"
        }else{
            welcomeLabel.isHidden = true
            askLabel.isHidden = true
            img.isHidden = true
        }
        
        return view
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.collectionView {
            
        
            if section == 0 {
                return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
            }
            else {
                return UIEdgeInsets(top: -175, left: 15, bottom: 0, right: 20)
            }
        }
        else {
            return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        if indexPath.section == 0 {
            let screenWidth = UIScreen.main.bounds.width
            return CGSize(width: screenWidth, height: 120)
        }
        else {
            let screenWidth = UIScreen.main.bounds.width
            let width = floor((screenWidth - (20+15+20+20))/2)
            let height = (210/170) * width
            return CGSize(width: width, height: height)
        }
        
        
    }
    
}
