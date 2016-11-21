//  Eleutherococcus
//  Created by Nekokoatl on 22/11/15.
//  Copyright © 2015 Nekokoatl. All rights reserved.


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var weightOfStuff: UILabel!

    
    @IBOutlet weak var CircleViewLocation: CircleView!
    
    @IBOutlet weak var trees2link: UIImageView!
    
    var timestamp:TimeInterval?
    var timestamp2:TimeInterval?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self.view)
        self.CircleViewLocation.center = touchLocation
        timestamp = touch.timestamp
  //      var treesColor: UIColor? = (UIColor(patternImage: UIImage(named: "trees.png")!))
//        print ("touches began at point = \(touchLocation), force = \(touch.force)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self.view)

        timestamp2 = touch.timestamp
        print(timestamp2! - timestamp!)

        self.CircleViewLocation.center = touchLocation
        
        
        let pressureColour  = UIColor(red:calculateRedness(touch.force), green:0.2, blue:0.5, alpha:1)
        print("force = \(touch.force)")
        self.CircleViewLocation.circleColor = pressureColour
        self.CircleViewLocation.cornerRadii = calculateRadii(touch.force)
        self.CircleViewLocation.setNeedsDisplay()
        
        weightOfStuff.text = "\(touch.force)"
        weightOfStuff.textColor = UIColor(red:calculateRedness(touch.force), green:0.2, blue:0.8, alpha:1)
        trees2link.alpha = calculateRedness(touch.force)
        
//        if timestamp2! - timestamp! >= 3 {
//            purr()
//        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
   //     let touch = touches.first!
//        let touchLocation = touch.locationInView(self.view)
//        print ("touches ended at point = \(touchLocation), force = \(touch.force)")

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self.view)
        print ("touches cancelled at point = \(touchLocation), force = \(touch.force)")

    }
    
    
    
     func purr() {
        print("meow")
        // Load
        let soundURL = Bundle.main.url(forResource: "purr", withExtension: "mp3")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL! as CFURL, &mySound)
        
        // Play
        AudioServicesPlaySystemSound(mySound);
        
    }

    
    
    func calculateRedness (_ force:CGFloat) -> CGFloat{
        let forceRange:CGFloat = 6.666 - 0.0
        let colorRange:CGFloat = 1.0 - 0.0
        let redness:CGFloat = (((force - 0.0) * colorRange) / forceRange) + 0.0
        return redness
    }
    

    func calculateRadii (_ force:CGFloat) -> CGSize {
        let forceRange: CGFloat = 6.666 - 0.0
        
        let radiiWidthRange: CGFloat = CircleViewLocation.frame.width - 0.0
        let radiiHeightRange: CGFloat = CircleViewLocation.frame.height - 0.0
        
        let radiiWidth: CGFloat = (((force - 0.0) * radiiWidthRange) / forceRange) + 0.0
        let radiiHeight: CGFloat = (((force - 0.0) * radiiHeightRange) / forceRange) + 0.0
        
        return CGSize(width: radiiWidth, height: radiiHeight) }}




