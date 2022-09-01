//
//  ViewController.swift
//  2.Camera
//
//  Created by USER on 24/07/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var changeProfilePhoto: UIButton!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var chossesPhotoBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        takePhotoBtn.isHidden = true
        chossesPhotoBtn.isHidden = true
        profileImage.layer.cornerRadius = 100
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
    }

    @IBAction func changeProfileImageBtnAction(_ sender: Any) {

        changeProfilePhoto.isHidden = true
        let vc = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            vc.sourceType = .camera
        } else{
            vc.sourceType = .photoLibrary
        }
        vc.modalPresentationStyle = .overFullScreen
        
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }

}
extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else{
            print("No Image Found")
            return
        }
        print(image.size)
        picker.dismiss(animated: true){
            self.profileImage.image = image
            self.changeProfilePhoto.isHidden = false
            
        }
    }
}
