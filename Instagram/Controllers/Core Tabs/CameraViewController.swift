//
//  CameraViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import AVFoundation
import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("拍照", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapTakePicture() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker,animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
    
}
