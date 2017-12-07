//
//  RegisterViewController.swift
//  IMOVE3
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var ref: DatabaseReference!
    var refHandle:UInt!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
         ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func Register(_ sender: Any) {
        var name = nameTextField.text
        var password = passwordTextField.text
        var img = profileImage.image
        var level = 1;
        var totalScore = 0;
        var logedIn = false;
        
        
        let refImage = Storage.storage().reference().child("Users").child("\(name!).jpg")
        if let uploadData = UIImagePNGRepresentation(img!)
        {
            refImage.putData( uploadData , metadata: nil, completion: { (metadata, error) in
                if error != nil
                {
                    print(error)
                    return
                }
                if let productImageURL = metadata?.downloadURL()?.absoluteString {
                    let value = [
                        "name" : name,
                        "password" : password,
                        "level" : level,
                        "profileImage" : productImageURL,
                        "totalScore" : totalScore,
                        "loggedIn" : logedIn
                        ] as [String : Any]
                    self.saveProductIntoDatabase(name: name!, value: value)
                }
            })
        }
        nameTextField.text = ""
        
    }
    
    private func saveProductIntoDatabase(name:String,value:[String:Any])
    {
        self.ref.child("Users").child(name).setValue(value)
    }
    
    
    @IBAction func SetImage(_ sender: UITapGestureRecognizer)
    {
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        guard let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
            else{
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        profileImage.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem)
    {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
