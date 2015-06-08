//
//  PhotoViewController.swift
//  facebook-photo
//
//  Created by Cece Yu on 6/7/15.
//  Copyright (c) 2015 Cece Yu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate  {

    var photo: UIImage!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var actionButtons: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        photoImageView.image = photo
        
        scrollView.contentSize = CGSize(width: 320, height: 800)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneTap(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let scrollTranslation = scrollView.panGestureRecognizer.translationInView(scrollView).y
        
        if scrollView.panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            if scrollTranslation < 100 {
                doneButton.alpha = 1 - (scrollTranslation/100)
                actionButtons.alpha = 1 - (scrollTranslation/100)
                scrollView.backgroundColor = UIColor(white: 0, alpha: 1 - (scrollTranslation/200))
            }
            
            if scrollTranslation > 100 {
                doneButton.alpha = 0
                actionButtons.alpha = 0
            }
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // When user begins to drag
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
        let scrollTranslation = scrollView.panGestureRecognizer.translationInView(scrollView).y
        if scrollTranslation > 100 {
            dismissViewControllerAnimated(true, completion: { () -> Void in
            })
        }
        else {
            //Just go back to default behavior..
        }
        
        doneButton.alpha = 1
        actionButtons.alpha = 1
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
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
