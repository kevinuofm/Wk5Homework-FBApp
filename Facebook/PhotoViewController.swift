//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Kevin Zhu on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size

        imageView.image = image
        
        scrollView.delegate = self
        
        
        
        
        //print("the photo name is ", imageView)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        var imageOriginalCenter: CGPoint!
        imageOriginalCenter = imageView.center

     if sender.state == UIGestureRecognizerState.Began {
        
           // imageOriginalCenter = imageView.center
        
        } else if sender.state == UIGestureRecognizerState.Changed {
        
            imageView.center = CGPoint(x: imageOriginalCenter.x, y: imageOriginalCenter.y + translation.y)
        
        print("translation is at", translation.y)
   
        
        } else if sender.state == UIGestureRecognizerState.Ended {
        
        if translation.y > 100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
            print("Gesture ended at: \(point)")
        }

    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDoneButton(sender: UIButton) {
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
