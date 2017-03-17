//
//  UploadMediaViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class UploadMediaViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    var mediaID : NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func uploadMediaSwift(_ sender: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate=self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        let writePath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("savedImage.png")
        
        let sdk = OPGSDK()        // Creating OPGSDK instance
        
        do {
            mediaID = try sdk.uploadMediaFile(writePath.absoluteString) as NSString?
        }
        catch{
            print("Upload Media Media Failed")         /* @"Error Occured. Contact Support!" */
            
        }
        print("Uploaded media ID is \(mediaID)" )
        self.dismiss(animated: true, completion: nil);
    }

}
