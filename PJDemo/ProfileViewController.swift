//
//  ProfileViewController.swift
//  PJDemo
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var usrImageView: UIImageView!
    let picker = UIImagePickerController()
    
//    @IBAction func changePic(sender: AnyObject) {
//        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
//        alertVC.addAction(UIAlertAction(title: "Take a photo", style: .Default, handler: {action in self.shootPhoto()}))
//        alertVC.addAction(UIAlertAction(title: "From Library", style: .Default, handler: {action in self.photoFromLibrary()}))
//        alertVC.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
//        presentViewController(alertVC, animated: true, completion: nil)
//    }
    
    func shootPhoto(){
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil{
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.modalPresentationStyle = .FullScreen
            presentViewController(picker, animated: true, completion: nil)
        }else{
            noCamera()
        }
        
    }
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    
    func photoFromLibrary(){
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)
    
    }
    
    
    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
        let viewController : UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        usrImageView.layer.cornerRadius = usrImageView.frame.size.height/2
        usrImageView.layer.borderWidth = 1
        usrImageView.layer.borderColor = UIColor.whiteColor().CGColor
        usrImageView.clipsToBounds = true
        
        if let pUsername = PFUser.currentUser()?["username"] as? String{
            self.usernameField.text = "@" + pUsername
        }
        if let userPicture = PFUser.currentUser()?["profilePic"] as? PFFile {
            userPicture.getDataInBackgroundWithBlock({
                (imageData, error) -> Void in
                if (error == nil)&&(imageData != nil) {
                    let image = UIImage(data:imageData!)
                    self.usrImageView.contentMode = .ScaleAspectFill
                    self.usrImageView.image = image
                }
            })
        }else{
            self.usrImageView.image = UIImage(named: "user")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        usrImageView.contentMode = .ScaleAspectFill
        usrImageView.image = chosenImage
        dismissViewControllerAnimated(true, completion: nil)
        let imageData = UIImageJPEGRepresentation(chosenImage, 1)
        let imageFile = PFFile(data: imageData!)
        
        var spinner : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
        spinner.startAnimating()
        PFUser.currentUser()!.setObject(imageFile, forKey: "profilePic")
        PFUser.currentUser()!.saveInBackgroundWithBlock {
            (success, error) -> Void in
            spinner.stopAnimating()
            if (error != nil) {
                var alertVC = UIAlertView(title: "Error", message: "somthing got wrong..", delegate: self, cancelButtonTitle: nil)
                alertVC.show()
            }
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
