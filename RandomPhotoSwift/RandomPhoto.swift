//
//  RandomPhoto.swift
//  RandomPhotoSwift
//
//  Created by RainSea on 10/29/14.
//  Copyright (c) 2014 RainSea. All rights reserved.
//

import UIKit
import AVFoundation
class RandomPhoto: UIViewController {

    var photos = [
        UIImage(named: "01.jpg"),
        UIImage(named: "02.jpg"),
        UIImage(named: "03.jpg"),
        UIImage(named: "04.jpg"),
        UIImage(named: "05.jpg"),
        UIImage(named: "06.jpg"),
        UIImage(named: "07.jpg"),
        UIImage(named: "08.jpg")]
    var tapRecognizer: UIGestureRecognizer?
    var sound: AVAudioPlayer?
    var trashSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("empty trash", ofType: "aif")!)
    var buttonTrash: UIButton?
    var aPhoto: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.userInteractionEnabled = true
        self.tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        self.view.addGestureRecognizer(tapRecognizer!)
        let bound = self.view.bounds
        //create button
        var imgTrash = UIImage(named: "EmptyTrash.png")
        buttonTrash = UIButton()
        buttonTrash!.setImage(imgTrash, forState: UIControlState.Normal)
        buttonTrash!.frame = CGRect(x: 0, y: 0, width: imgTrash!.size.width , height: imgTrash!.size.height)
        buttonTrash!.center = CGPoint(x: bound.size.width * 0.9, y: bound.size.height * 0.9)
        buttonTrash!.addTarget(self, action: "clickOnTrash:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonTrash!)
    }
    
    func handleTap(tapRecognizer: UITapGestureRecognizer) {
        var index = rand() % 8
        aPhoto = UIImageView(image: self.photos[Int(index)])
        aPhoto!.center = tapRecognizer.locationInView(self.view)
        aPhoto!.makeItCool()
        aPhoto!.addGestureRecognizer()
        self.view.addSubview(aPhoto!)
        self.view.bringSubviewToFront(buttonTrash!)
    }
    
    func clickOnTrash(view_photo: UIView){
        for view_photo in self.view.subviews {
            if(view_photo.isMemberOfClass(UIImageView)){
            
            UIView.animateWithDuration(1.0, animations: {
//                view_photo.center = self.buttonTrash!.center
                let transfrom = CGAffineTransformMakeScale(0.1, 0.1)
//                view_photo.transform = transfrom
//                view_photo.alpha = 0.1
                }, completion:  { finished in
                    view_photo.removeFromSuperview()
                })
            }
            
        }
        
        }
    

}
    
    
    



   

