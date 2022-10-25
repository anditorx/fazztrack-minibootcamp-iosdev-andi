//
//  NewRestaurantViewController.swift
//  FoodPin
//
//  Created by Armstrong on 24/10/22.
//

import UIKit

class NewRestaurantViewController: UITableViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    
    var completion: (UIImage, String, String, String, String, String) -> Void = { (_, _, _, _, _, _) in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        save()
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
       dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            takePicture()
        }
    }
    
    func save() {
        
        if let image = imageView.image,
           let name = nameTextField.text, !name.isEmpty,
            let type = typeTextField.text, !type.isEmpty,
            let address = addressTextField.text, !address.isEmpty,
            let phone = phoneTextField.text, !phone.isEmpty,
           let desc = descTextView.text, !desc.isEmpty {
            
            completion(image, name, type, address, phone, desc)
            
            closeButtonTapped(self)
            
        }
        else {
            let alert = UIAlertController(title: "Oops!", message: "We can't proceed because one of the field is blank. Please note that all fields are required.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
        }
        
    }
    
    // action sheet get picture
    func takePicture() {
        let actionSheet = UIAlertController(title: nil, message: "Choose your photo source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_) in
            self.takePictureSource(source: .camera)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(_) in
            self.takePictureSource(source: .photoLibrary)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
        self.takePictureSource(source: .photoLibrary)
    }
    
    // get picture source
    func takePictureSource(source: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            return
        }
        
        let viewController = UIImagePickerController()
        viewController.sourceType = source
        viewController.allowsEditing = false
        viewController.delegate = self
        
        present(viewController, animated: true)
        
    }
    
}

extension NewRestaurantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
        }
        dismiss(animated: true)
    }
    
}
