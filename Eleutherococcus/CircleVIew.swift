//
//  CircleVIew.swift
//  Eleutherococcus
//
//  Created by Nekokoatl on 22/11/15.
//  Copyright © 2015 Nekokoatl. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circleColor: UIColor? = UIColor(red:0.96, green:0.77, blue:0.22, alpha:1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        self.circleColor!.setFill()
        path.fill()
    }
}
