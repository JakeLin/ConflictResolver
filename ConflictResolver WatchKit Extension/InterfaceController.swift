//
//  InterfaceController.swift
//  ConflictResolver WatchKit Extension
//
//  Created by Jake Lin on 26/11/2014.
//  Copyright (c) 2014 Jake Lin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var actionImage: WKInterfaceImage!
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        // Configure interface objects here.
        NSLog("%@ init", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

    func delay(delay: Double, closure:() ->()){
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func playTapped() {
        NSLog("playTapped")
        actionImage.setImageNamed("action")
        actionImage.startAnimatingWithImagesInRange(
            NSRange(location: 0, length: 3),
            duration: 0.3,
            repeatCount: 3)
        
        delay(0.9) {
            var imageNumber = arc4random_uniform(3)
            self.actionImage.setImageNamed("action\(imageNumber)")
        }
    }
}
