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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionBox01", for: indexPath) as! HomeCollectionViewCell
        
        let item = indexPath.item
       
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.titleLabel.text = item == 0 ? "Meditation 101" : "Cardio Meditation"
        cell.descLabel.text = item == 0 ? "Techniques, Benefits, and a Beginner’s How-To" : "Basics of Yoga for Beginners or Experienced Professionals"
        
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indeqxPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = floor((screenWidth - (20+15+20+20))/2)
        let height = (210/170) * width
        return CGSize(width: width, height: height)
    }
    
}
