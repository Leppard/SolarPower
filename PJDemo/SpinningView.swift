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
        centerLabel.font = UIFont.systemFontOfSize(17)
        self.addSubview(centerLabel)
        
        circleLayer.removeAllAnimations()
        circleLayer.bounds = bounds
        circleLayer.lineWidth = 10
        tintColorDidChange()
        layer.addSublayer(circleLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath(ovalInRect: circleLayer.bounds)
        circleLayer.position = center
        circleLayer.path = path.CGPath
    }
    
    func updateAnimation(percent: Double, color: UIColor) {
        circleLayer.fillColor = UIColor(red: 238/255, green: 232/255, blue: 170/255, alpha: 0.2).CGColor
        circleLayer.strokeColor = color.CGColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = percent
        animation.duration = 3 * (percent/1.0)
        
        circleLayer.addAnimation(animation, forKey: "strokeEnd")
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = CGFloat(percent)
        
        centerLabel.textColor = color
        centerLabel.text = "\(percent*100)%"
    }
}
