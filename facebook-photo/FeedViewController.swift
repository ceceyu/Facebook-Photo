//
//  FeedViewController.swift
//  facebook-photo
//
//  Created by Cece Yu on 6/7/15.
//  Copyright (c) 2015 Cece Yu. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var selectedImageView: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 1438)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPhotoTao(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView        
        performSegueWithIdentifier("photoSegue", sender: sender)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationController = segue.destinationViewController as! PhotoViewController
        destinationController.photo = selectedImageView.image
    }

}
