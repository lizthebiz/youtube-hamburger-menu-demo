//
//  hamburgerDemoViewController.swift
//  hamburgerDemo
//
//  Created by Liz Dalay on 10/28/15.
//  Copyright © 2015 Liz Dalay. All rights reserved.
//

import UIKit

class hamburgerDemoViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentPanGesture: UIPanGestureRecognizer!
    
    var menuViewController: UIViewController!
    var contentViewController: UIViewController!
    
    var contentInitialOrigin: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        
        contentViewController = storyboard.instantiateViewControllerWithIdentifier("ContentViewController")
        
        menuView.addSubview(menuViewController.view)
        
        contentView.addSubview(contentViewController.view)
        
        let contentPanGesture = UIPanGestureRecognizer(target: self, action: "onPan:")
        
        contentView.addGestureRecognizer(contentPanGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            contentInitialOrigin = contentView.frame.origin
    
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            contentView.frame.origin = CGPoint(x: contentInitialOrigin.x + translation.x, y: contentInitialOrigin.y)
            //contentView.frame.origin.x = contentInitialOrigin.x + 40
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
    
    }
}
