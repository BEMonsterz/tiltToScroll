//
//  TiltViewController.swift
//  tiltToScroll
//
//  Created by Bryan Ayllon on 7/14/16.
//  Copyright © 2016 Bryan Ayllon. All rights reserved.
//


import UIKit
import CoreMotion

class TiltToScrollViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var textView :UITextView!
    var manager :CMMotionManager!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
        var speed :CGFloat = 0.0
        var vertical :CGFloat = 0.0
        
        self.manager = CMMotionManager()
        
        if self.manager.deviceMotionAvailable {
            
            self.manager.deviceMotionUpdateInterval = 0.1
            
            self.manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (data :CMDeviceMotion?, error: NSError?) in
                
                guard let accelerationY = data?.gravity.y else {
                    fatalError("Gravity is not defined!")
                }
                
                if accelerationY >= -0.58 && accelerationY <= -0.27 {
                    
                    speed = 5
                    vertical += self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, vertical)
                    self.textView.setContentOffset(newOffset, animated: true)
                }
                    
                else if accelerationY >= -0.92 && accelerationY <= -0.86 {
                    speed = 5
                    vertical -= self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, vertical)
                    self.textView.setContentOffset(newOffset, animated: true)
                }

                
            }
            
        }
        
        
        
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
    
}
