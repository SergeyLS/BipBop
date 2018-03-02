//
//  CALayer.swift
//  BipBop
//
//  Created by Sergey Leskov on 3/2/18.
//  Copyright © 2018 Sergey Leskov. All rights reserved.
//

import UIKit

extension CALayer {
    func addGradienBorder(colors:[UIColor] = [UIColor.red,UIColor.blue], width:CGFloat = 1) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =  CGRect(origin: .zero, size: self.bounds.size)
        gradientLayer.startPoint = CGPoint(x:0.0, y:0.5)
        gradientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        gradientLayer.colors = colors.map({$0.cgColor})
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = shapeLayer
        
        self.addSublayer(gradientLayer)
    }
}
