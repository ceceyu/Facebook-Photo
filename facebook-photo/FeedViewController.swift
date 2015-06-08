//
//  FeedViewController.swift
//  facebook-photo
//
//  Created by Cece Yu on 6/7/15.
//  Copyright (c) 2015 Cece Yu. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
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
        destinationController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationController.transitioningDelegate = self
    }
    
    // MARK: - Delegate methods

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        var prestigeImageView = UIImageView(image: selectedImageView.image)
        
        if (isPresenting) {
            
            containerView.addSubview(toViewController.view)
            fromViewController.view.addSubview(prestigeImageView)
            prestigeImageView.frame = selectedImageView.frame
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                toViewController.view.alpha = 1
                prestigeImageView.frame = (toViewController as!PhotoViewController).photoImageView.frame
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    prestigeImageView.removeFromSuperview()
            }
        } else {
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

}
