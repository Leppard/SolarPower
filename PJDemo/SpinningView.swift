//
//  SpinningView.swift
//  TearDownCircle
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SpinningView: UIView {
    
    let circleLayer = CAShapeLayer()
    
    var percentageLabel = UILabel()
    
    var centerLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup()
    {
        centerLabel.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width/4, UIScreen.mainScreen().bounds.size.width/4)
        centerLabel.textAlignment = .Center
        centerLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(centerLabel)
        
        circleLayer.removeAllAnimations()
        circleLayer.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width/4, UIScreen.mainScreen().bounds.size.width/4)
        circleLayer.lineWidth = 12
        tintColorDidChange()
        layer.addSublayer(circleLayer)
    }
    
    func updateAnimation(percent: Double, color: UIColor) {
        let center = CGPoint(x: circleLayer.bounds.width/2, y: circleLayer.bounds.height/2)
        let path = UIBezierPath.init(arcCenter: center, radius: circleLayer.bounds.width/2-40, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.CGPath
//        
        circleLayer.fillColor = UIColor(red: 238/255, green: 232/255, blue: 170/255, alpha: 0.2).CGColor
        circleLayer.strokeColor = color.CGColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = percent
        animation.duration = 1 * (percent/1.0)
        
        circleLayer.addAnimation(animation, forKey: "strokeEnd")
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = CGFloat(percent)
        
        centerLabel.textColor = color
        centerLabel.text = "\(percent*10)KW/h"
    }
}
