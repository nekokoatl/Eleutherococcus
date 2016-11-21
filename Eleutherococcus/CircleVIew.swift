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
    var cornerRadii: CGSize? = CGSize(width: 0.0, height: 0.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
     let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii:cornerRadii!)
        self.circleColor!.setFill()
        path.fill()
    }
    
}
