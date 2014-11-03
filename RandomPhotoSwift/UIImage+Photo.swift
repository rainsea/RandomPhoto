//
//  UIImage+Photo.swift
//  RandomPhotoSwift
//
//  Created by RainSea on 11/2/14.
//  Copyright (c) 2014 RainSea. All rights reserved.
//

import UIKit
extension UIImageView {

    func makeItCool() {
        self.layer.masksToBounds = false
        
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.whiteColor().CGColor!
        
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.85
        self.layer.shadowOffset = CGSizeMake(1.0, 2.0)
        self.layer.shadowColor = UIColor.blackColor().CGColor!
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
        
        var random = CGFloat(Float(arc4random())/Float(UINT32_MAX)-0.5)
        
        var transform = CGAffineTransformMakeRotation(random)
        self.transform = transform
    }
    
    func addGestureRecognizer() {
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        var rotateRecognizer = UIRotationGestureRecognizer(target: self, action: "rotateMe:")
        self.addGestureRecognizer(rotateRecognizer)
        
        var pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchMe:")
        self.addGestureRecognizer(pinchRecognizer)
    }
    
    func rotateMe(rotateRecognizer: UIRotationGestureRecognizer) {
        var transform = CGAffineTransformMakeRotation(rotateRecognizer.rotation)
        self.transform = transform
    }
    func pinchMe(pinchRecognizer: UIPinchGestureRecognizer) {
        var transform = CGAffineTransformMakeScale(pinchRecognizer.scale, pinchRecognizer.scale)
        self.transform = transform
    }
    
}