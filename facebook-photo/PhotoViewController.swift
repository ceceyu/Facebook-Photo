//
//  PhotoViewController.swift
//  facebook-photo
//
//  Created by Cece Yu on 6/7/15.
//  Copyright (c) 2015 Cece Yu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photo: UIImage!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = photo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneTap(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
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
