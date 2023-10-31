//
//  ViewController.swift
//  NeuroStyle
//
//  Created by Hema Deva Sagar Potala on 9/1/23.
//

import UIKit

class ViewController: UIViewController{

    
    let picker = UIImagePickerController()
    var selectedImage : UIImage?
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.allowsEditing = true
        picker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraClicked(_ sender: Any) {
        print("camera clicked")
    }
    
    @IBAction func galleryClicked(_ sender: Any) {
        accessPhotos()
    }
    
    func accessPhotos(){
        picker.sourceType = .photoLibrary
        present(picker, animated:true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("nothing as of now")
        let destVC = segue.destination as! PresentViewController
        destVC.selectedImage = selectedImage
        // TODO: - Pass the UIImage read after picker selection to the destination
    }
}

//MARK: - NavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate{
    
}

// MARK: - ImagePickerControllerDelegate
extension ViewController : UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = imageSelected
            performSegue(withIdentifier: "GoToModify", sender: self)
        }
        
        
        // TODO: - Add the picker scroll with style images embedded in them
    }
}
