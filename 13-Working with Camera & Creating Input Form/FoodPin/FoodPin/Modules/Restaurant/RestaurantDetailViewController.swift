//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Armstrong on 22/10/22.
//

import UIKit
import MapKit
import SafariServices

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnRate: UIButton!
    
    var index: Int!
    var name: String!
    var thumbnails: UIImage!
    var category: String!
    var desc: String!
    var address: String!
    var phone: String!
    var latitude: Double!
    var longitude: Double!
    var viewModel: RestaurantsViewModel!
    var annotation: Any!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        componentDidMount()
    }
    
    func componentDidMount() {
        imageViewDetail.image = thumbnails
        nameLabel.text = name
        categoryLabel.text = category
        descLabel.text = desc
        addressLabel.text = address
        phoneLabel.text = phone
        mapView.delegate = self
        btnRate.layer.masksToBounds = true
        btnRate.layer.cornerRadius = 20
        
        // annotation
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annoation = MKPointAnnotation()
        annoation.coordinate = coordinate
        mapView.addAnnotation(annoation)
        
        // region
        let region = mapView.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200))
        mapView.setRegion(region, animated: true)
        
        mapView.setRegion(region, animated: true)
        
        
    }
}

// MARK: - MKMapViewDelegate
extension RestaurantDetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        routeToPlace()
    }
    
    func routeToPlace() {
        let actionSheet = UIAlertController(title: "Directions using", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Maps", style: .default, handler: { (_) in
            self.openMaps()
        }))
        
        if canOpen(urlScheme: "comgooglemaps") {
            actionSheet.addAction(UIAlertAction(title: "Google Maps", style: .default, handler: { (_) in
                self.openGoogleMaps()
            }))
        }
        
        if canOpen(urlScheme: "waze") {
            actionSheet.addAction(UIAlertAction(title: "Waze", style: .default, handler: { (_) in
                self.openWaze()
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
    }
    
    func canOpen(urlScheme: String) -> Bool {
        var components = URLComponents()
        components.scheme = urlScheme
        if let url = components.url {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func openMaps() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    func openGoogleMaps() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let latString = String(format: "%.6f", coordinate.latitude)
        let lngString = String(format: "%.6f", coordinate.longitude)
        let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latString),\(lngString)&directionsmode=driving")!
        let application = UIApplication.shared
        if application.canOpenURL(url) {
            application.open(url)
        }
    }
    
    func openWaze() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let latString = String(format: "%.6f", coordinate.latitude)
        let lngString = String(format: "%.6f", coordinate.longitude)
        let url = URL(string: "waze://?ll=\(latString),\(lngString)&navigate=yes")!
        let application = UIApplication.shared
        if application.canOpenURL(url) {
            application.open(url)
        }
    }
    
}
