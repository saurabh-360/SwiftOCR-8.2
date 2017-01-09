//
//  ViewController.swift
//  SwiftOCRDemo_8.2
//
//  Created by Saurabh Yadav on 09/01/17.
//  Copyright © 2017 Saurabh Yadav. All rights reserved.
//

import UIKit
import SwiftOCR

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    private let ocrInstance = SwiftOCR()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
//
        self.ocrInstance.recognize(UIImage.init(named: "imageTest")!) { [weak self] recognizedString in
            DispatchQueue.main.async {
                print(recognizedString)
                print(self?.ocrInstance.currentOCRRecognizedBlobs ?? "Recoginzed Blob is empty")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photofromLibrary(_ sender: UIButton) {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        
        self.ocrInstance.recognize(chosenImage) { [weak self] recognizedString in
            DispatchQueue.main.async {
                print(recognizedString)
                print(self?.ocrInstance.currentOCRRecognizedBlobs ?? "Recoginzed Blob is empty")
            }
        }
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

