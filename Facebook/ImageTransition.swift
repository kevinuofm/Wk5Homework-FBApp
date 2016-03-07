//
//  ImageTransition.swift
//  fbTransitionDemo
//
//  Created by Kevin Zhu on 3/6/16.
//  Copyright © 2016 Kevin Zhu. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        let tabBarViewController = fromViewController as! UITabBarController // from Emma
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController // from Emma
        
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController // from Emma
 //       let newsFeedViewController = fromViewController as! NewsFeedViewController
        
        let movingImageView = UIImageView() //this creates a new imageview
        
        movingImageView.frame = newsFeedViewController.selectedImageView.frame //this clones the position and size
        
        //movingImageView.frame = photoViewController.imageView.frame //this clones the position and size
        
        movingImageView.image = newsFeedViewController.selectedImageView.image //this clones the image itself into the new view
        
        
        //movingImageView.image = photoViewController.imageView.image //this clones the image itself into the new view
        
        movingImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds // copies over the properties like whether to clip the sides
        
        //movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds // copies over the properties like whether to clip the sides
        
        movingImageView.contentMode = newsFeedViewController.selectedImageView.contentMode // contentmode is like aspect fill, centered etc. copies that too.
        //movingImageView.contentMode = photoViewController.imageView.contentMode // contentmode is like aspect fill, centered etc. copies that too.
        
        //containerView.addSubview(movingImageView) // adds it to the
        photoViewController.imageView.addSubview(movingImageView)// no idea why this is here... from Diana
        
        photoViewController.imageView.alpha = 0
        newsFeedViewController.selectedImageView.alpha = 0 // makes the smaller image disappear at first once selected
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            
            toViewController.view.alpha = 1
            
            //this makes the new view on the second screen the first.
            movingImageView.frame = photoViewController.imageView.frame
            
            
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                newsFeedViewController.selectedImageView.alpha = 1
                
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    

    
}
