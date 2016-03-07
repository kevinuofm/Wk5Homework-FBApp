//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var selectedImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBAction func didPressPhoto(sender: UITapGestureRecognizer) {
        //sets the thing you tapped on to selected ImageView.

        selectedImageView = sender.view as! UIImageView

        performSegueWithIdentifier("photoSegue", sender: nil)
        
    
        
        print(selectedImageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }


    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.view.layoutIfNeeded()
        

        //print(selectedImageView)
        photoViewController.imageView.image = selectedImageView.image
        
        
    //this line or the previous line... which one is correct? This one doesn't work... the photo doesn't come up.
     //  photoViewController.image = self.selectedImageView.image
        
    
        
        
        
        
        
        
        
        
        
        
        
    }
  

    
    


}
