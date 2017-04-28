//
//  ViewController.swift
//  ImagePickerExam
//
//  Created by jwh on 2017. 4. 6..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var pictureIV: UIImageView!

    @IBAction func pickupPicture(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            pictureIV.contentMode = .scaleAspectFit
            pictureIV.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

