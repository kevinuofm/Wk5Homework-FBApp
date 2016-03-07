//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Kevin Zhu on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        //print("the photo name is ", imageView)
        // Do any additional setup after loading the view.
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
