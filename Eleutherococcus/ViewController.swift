//  Eleutherococcus
//  Created by Nekokoatl on 22/11/15.
//  Copyright © 2015 Nekokoatl. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightOfStuff: UILabel!

    
    @IBOutlet weak var CircleViewLocation: CircleView!
    
    @IBOutlet weak var trees2link: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.locationInView(self.view)
        self.CircleViewLocation.center = touchLocation
        
  //      var treesColor: UIColor? = (UIColor(patternImage: UIImage(named: "trees.png")!))
//        print ("touches began at point = \(touchLocation), force = \(touch.force)")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.locationInView(self.view)
        self.CircleViewLocation.center = touchLocation
        
        
        let pressureColour  = UIColor(red:calculateRedness(touch.force), green:0.2, blue:0.5, alpha:1)
        print("force = \(touch.force)")
        self.CircleViewLocation.circleColor = pressureColour
        self.CircleViewLocation.setNeedsDisplay()
        
        weightOfStuff.text = "\(touch.force)"
        weightOfStuff.textColor = UIColor(red:calculateRedness(touch.force), green:0.2, blue:0.8, alpha:1)
        trees2link.alpha = calculateRedness(touch.force)
//        print ("touches moved at point = \(touchLocation), force = \(touch.force)")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.locationInView(self.view)
//        print ("touches ended at point = \(touchLocation), force = \(touch.force)")

    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        let touch = touches!.first!
        let touchLocation = touch.locationInView(self.view)
        print ("touches cancelled at point = \(touchLocation), force = \(touch.force)")

    }
    
    func calculateRedness (force:CGFloat) -> CGFloat{
        let forceRange:CGFloat = 6.666 - 0.0
        let colorRange:CGFloat = 1.0 - 0.0
        let redness:CGFloat = (((force - 0.0) * colorRange) / forceRange) + 0.0
        return redness
    }
    

    
}

